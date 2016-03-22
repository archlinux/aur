pkgname=dnf-plugins-core
_pkgver=0.1.19
_rpmrel=1
pkgver=$_pkgver.$_rpmrel
pkgrel=1
pkgdesc="Core DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('dnf' 'python')
makedepends=('cmake' 'python-sphinx')
checkdepends=('python-nose')
options=(!emptydirs)
source=("$url/archive/$pkgname-$_pkgver-$_rpmrel.tar.gz")
md5sums=('864418e87ab491556ca8ee0e8e1ea178')

prepare() {
	mv "$pkgname-$pkgname-$_pkgver-$_rpmrel" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
	      ..
	make
	# sphinx-build fails with non UTF-8 locales
	make LC_ALL=en_US.UTF-8 doc-man
}

check() {
	cd "$pkgname-$pkgver"
	PYTHONPATH=./plugins nosetests -s tests
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install

	install -D -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
