pkgname=dnf-plugins-core
_pkgver=0.1.11
_rpmrel=1
pkgver=$_pkgver.$_rpmrel
pkgrel=1
pkgdesc="Core DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('dnf' 'python')
makedepends=('cmake')
checkdepends=('python-nose')
source=("$url/archive/$pkgname-$_pkgver-$_rpmrel.tar.gz")
md5sums=('19e9b8303ee9f51207e115e9598d64b7')

prepare() {
	cd "$pkgname-$pkgname-$_pkgver-$_rpmrel"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgname-$_pkgver-$_rpmrel"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
	      ..
	make
}

check() {
	cd "$pkgname-$pkgname-$_pkgver-$_rpmrel"
	PYTHONPATH=./plugins nosetests -s tests
}

package() {
	cd "$pkgname-$pkgname-$_pkgver-$_rpmrel"/build
	make DESTDIR="$pkgdir/" install

	install -D -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
