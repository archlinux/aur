# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=drawpile
pkgver=1.0.2
pkgrel=2
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('x86_64' 'i686')
url='http://drawpile.net/'
license=('GPL2')
depends=('karchive' 'qt5-multimedia' 'desktop-file-utils')
optdepends=('kdnssd: automatic service discovery (such as printers)'
	'giflib: GIF support'
	'miniupnpc: UPnP support'
	'qt5-color-widgets: alternative color wheel'
	'libmicrohttpd: web-admin feature (server dependency)'
	'libsystemd: systemd and logging support (server dependency)')
makedepends=('qt5-tools' 'qt5-svg' 'ninja' 'cmake')
install="${pkgname}.install"
source=("http://drawpile.net/files/src/${pkgname}-${pkgver}.tar.gz"
	'0001-Support-miniupnpc-version-1.9.20150730.patch')
sha256sums=('012a470316ccca51a28700948cd3f866c9b7fcc8fa9bfa21f27f28e9dc53f019'
	'8bfda21cf734a36cafeeac1132337dbfddfb464f104a0c67acf9d5f4fc432727')

	## SET TO 'SERVER' OR 'CLIENT' FOR BUILDING SERVER OR CLIENT ONLY ##
	BUILD='BOTH'

prepare() {
	cd "${pkgname}-${pkgver}"

	patch -p1 -i '../0001-Support-miniupnpc-version-1.9.20150730.patch'
}

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
