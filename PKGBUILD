# Maintainer: Jordan Rudess <jrudess@gmail.com>
pkgname=levd-git
pkgver=r24.cd12fdf
pkgrel=4
pkgdesc="Daemon to control NZXT Kraken x61"
arch=('i686' 'x86_64')
url="https://github.com/graphcareful/levd"
license=('MIT')
depends=('google-glog' 'yaml-cpp' 'libusb' 'lm_sensors')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/leviathan/levd.cfg")
install=
source=('levd::git+https://github.com/graphcareful/levd.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "$srcdir/${pkgname%-git}/build"
	patch -Np1 -i "$srcdir/../${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
	cmake .. KRAKEN_LIB_LIBRARIES=":libsensors.so :libyaml-cpp.so :libglog.so.2 :libusb-1.0.so.0"

	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/${pkgname%-git}/LICENSE
}
