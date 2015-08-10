# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=drawpile
pkgver=1.0.1
pkgrel=3
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('x86_64' 'i686')
url='http://drawpile.net/'
license=('GPL2')
depends=('karchive' 'qt5-multimedia' 'desktop-file-utils')
optdepends=('kdnssd: automatic service discovery (such as printers)' 'qt5-color-picker: alternative color wheel' 'giflib: GIF support' 'miniupnpc: UPnP support' 'libmicrohttpd: web-admin feature (server dependency)' 'libsystemd: systemd and logging support (server dependency)')
makedepends=('qt5-tools' 'qt5-svg' 'ninja' 'cmake')
install="${pkgname}.install"
source=("http://drawpile.net/files/src/${pkgname}-${pkgver}.tar.gz")
sha256sums=('93d265ca48af01b845907857080400eeb02ed0b732f105bb52b1e2990eb941d5')

	## SET TO 'SERVER' OR 'CLIENT' FOR BUILDING SERVER OR CLIENT ONLY ##
	BUILD='BOTH'

build() {
	cd "${pkgname}-${pkgver}"

	# Ensure build is an empty directory
	rm -rf build
	mkdir -p build
	cd build

	local makeargs=''

	if [ -z "$BUILD" ]; then
		BUILD='BOTH'
	fi

	if [ "$BUILD" == 'CLIENT' ]; then
		warning 'BUILDING CLIENT ONLY.'
		makeargs='-DSERVER=off'
	elif [ "$BUILD" == 'SERVER' ]; then
		warning 'BUILDING STAND-ALONE SERVER ONLY.'
		makeargs='-DCLIENT=off'
	elif [ "$BUILD" != 'BOTH' ]; then
		error "You can set 'BUILD' TO 'SERVER', 'CLIENT' or 'BOTH' only!"
		return 1
	fi

	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -G Ninja -Wno-dev $makeargs
	ninja
}

package() {
	cd "${pkgname}-${pkgver}"

	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 "desktop/${pkgname}-128x128.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "desktop/${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
