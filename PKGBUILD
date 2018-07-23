pkgname=dnf-plugins-core
pkgver=3.0.2
pkgrel=1
pkgdesc="Core DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('dnf>=3.0.1' 'python')
makedepends=('cmake' 'python-sphinx')
checkdepends=('python-nose')
optdepends=('createrepo_c: for local plugin')
backup=('etc/dnf/plugins/debuginfo-install.conf'
        'etc/dnf/plugins/local.conf'
        'etc/dnf/plugins/versionlock.conf'
        'etc/dnf/plugins/versionlock.list')
options=(!emptydirs)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('853bf27ff05bbba4c15bdb37dff1487b')

prepare() {
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
	make doc-man
}

check() {
	cd "$pkgname-$pkgver"
	PYTHONPATH=./plugins nosetests -s tests
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install

	install -Dp -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
