pkgname=dnf-plugins-extras
pkgver=3.0.2
pkgrel=1
pkgdesc="Extras DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('dnf>=3.0.0' 'python')
makedepends=('cmake' 'python-sphinx')
checkdepends=('python-nose')
optdepends=('snapper: for snapper plugin'
            'tracer:  for tracer plugin')
backup=('etc/dnf/plugins/rpmconf.conf'
        'etc/dnf/plugins/torproxy.conf')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('704e92d0e39ede1b0e6fc0a98c93a018')

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

# Tests seem to need a minimal RPM database on the system
#check() {
#	cd "$pkgname-$pkgver"
#	PYTHONPATH=./plugins nosetests -s tests
#}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install

	install -Dp -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
