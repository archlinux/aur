# Maintainer: Albert Briscoe <albertsbriscoe@gmail.com>

pkgname=gqrx-nrsc5-git
pkgver=v2.15.9.r11.ga9254f0
pkgrel=1
pkgdesc="Interactive SDR receiver, with NRSC-5 (HD Radio) support"
arch=('x86_64')
url="https://github.com/Albert-S-Briscoe/gqrx/tree/nrsc5"
license=('GPL')
depends=('qt6-svg' 'libpulse' 'gnuradio-osmosdr' 'gr-nrsc5-rx')
makedepends=('git' 'cmake' 'boost')
provides=('gqrx')
conflicts=('gqrx')
source=("${pkgname}::git+https://github.com/Albert-S-Briscoe/gqrx.git#branch=nrsc5")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	echo "StartupNotify=false" >> gqrx.desktop
}

build() {
	cd "$pkgname"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$pkgname"
	install -Dm644 "gqrx.desktop" "$pkgdir/usr/share/applications/gqrx.desktop"
	install -Dm644 "resources/icons/gqrx.svg" "$pkgdir/usr/share/pixmaps/gqrx.svg"

	cd build
	install -Dm755 src/gqrx "$pkgdir/usr/bin/gqrx"
}
