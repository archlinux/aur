pkgname=dnf-plugins-extras
pkgver=4.1.0
pkgrel=1
pkgdesc="Extras DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('dnf>=4.4.3' 'python')
makedepends=('cmake>=3.13' 'python-sphinx')
checkdepends=('python-pytest' 'python-pykickstart')
optdepends=('python-dbus: for snapper plugin'
            'python-pycurl: for torproxy plugin'
            'python-pykickstart: for kickstart plugin'
            'snapper:  for snapper plugin'
            'tracer:  for tracer plugin')
backup=('etc/dnf/plugins/rpmconf.conf'
        'etc/dnf/plugins/torproxy.conf')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f48b19694df17573e6743671d8dec4baa3a46822352370ed77af06d9af7b632c')

prepare() {
	cd "$pkgname-$pkgver"

	# sphinx-build-3 does not exist on Arch Linux,
	# use sphinx-build instead
	sed -e 's/sphinx-build-3/sphinx-build/' \
	    -i doc/CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgver"

	cmake -B build \
	      -DCMAKE_INSTALL_PREFIX=/usr

	make -C build
	make -C build doc-man
}

# Tests seem to need a minimal RPM database on the system
#check() {
#	cd "$pkgname-$pkgver"
#
#	pytest
#}

package() {
	cd "$pkgname-$pkgver"

	make -C build DESTDIR="$pkgdir/" install

	install -Dp -m644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
