# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=drawpile
pkgver=1.0.2
pkgrel=3
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('i686' 'x86_64')
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
	'drawpile103.patch')
sha256sums=('012a470316ccca51a28700948cd3f866c9b7fcc8fa9bfa21f27f28e9dc53f019'
	'f25371be6b712c079dc1e742f246e2b9b60a9c6b083c3cebf60916c80521e160')

## SET TO 'SERVER' OR 'CLIENT' FOR BUILDING SERVER OR CLIENT ONLY ##
_build='BOTH'
_cmakeargs=('-Wno-dev')

## Used for interactive makepkg later ##
# msg  "If you wish to only install the server or client set '_build' to 'SERVER' or 'CLIENT' in the provided PKGBUILD file and recompile this package."
# msg2 "The package 'customizepkg' may be helpful in this case."

prepare() {
	cd "${pkgname}-${pkgver}"

	msg2 'Applying patches of unofficial Drawpile 1.0.3'
	patch -p1 -i '../drawpile103.patch'
}

build() {
	cd "${pkgname}-${pkgver}"

	# Ensure build is an empty directory
	rm -rf 'build'
	mkdir -p 'build'
	cd 'build'

	if [ -z "${_build}" ]; then
		_build='BOTH'
	fi

	if [ "${_build}" == 'CLIENT' ]; then
		warning 'BUILDING CLIENT ONLY.'
		_cmakeargs+=('-DSERVER=off')
	elif [ "${_build}" == 'SERVER' ]; then
		warning 'BUILDING STAND-ALONE SERVER ONLY.'
		_cmakeargs+=('-DCLIENT=off')
	elif [ "${_build}" != 'BOTH' ]; then
		error "You can set '_build' TO 'SERVER', 'CLIENT' or 'BOTH' only!"
		return 1
	fi

	cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -G Ninja "${_cmakeargs[@]}"
	ninja
}

package() {
	cd "${pkgname}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C 'build' install
	install -Dm644 "desktop/${pkgname}.svg" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
	install -Dm644 "desktop/${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
