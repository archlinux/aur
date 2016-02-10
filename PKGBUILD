# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgbase='drawpile'
pkgname=("${pkgbase}"{,'-client','-server','-common'})
pkgver=1.0.2
pkgrel=4
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('i686' 'x86_64')
url='http://drawpile.net/'
license=('GPL3')
makedepends=('karchive' 'qt5-multimedia' 'qt5-tools' 'qt5-svg' 'ninja' 'cmake')
source=("http://drawpile.net/files/src/${pkgbase}-${pkgver}.tar.gz"
	'drawpile103.patch')
sha256sums=('012a470316ccca51a28700948cd3f866c9b7fcc8fa9bfa21f27f28e9dc53f019'
	'f25371be6b712c079dc1e742f246e2b9b60a9c6b083c3cebf60916c80521e160')

_cmakeargs+=('-Wno-dev')

## Used for interactive makepkg later ##
# msg  "If you wish to only install the server or client set '_build' to 'SERVER' or 'CLIENT' in the provided PKGBUILD file and recompile this package."
# msg2 "The package 'customizepkg' may be helpful in this case."

prepare() {
	cd "${pkgbase}-${pkgver}"

	msg2 'Applying patches of unofficial Drawpile 1.0.3'
	patch -p1 -i '../drawpile103.patch'
}

build() {
	cd "${pkgbase}-${pkgver}"

	# Ensure build is an empty directory
	rm -rf 'build'
	mkdir -p 'build'
	cd 'build'

	cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -G Ninja "${_cmakeargs[@]}"
	ninja
}

package_drawpile() {
	pkgdesc+=' (meta package)'
	arch=('any')
	depends=('drawpile-client' 'drawpile-server')
}

package_drawpile-client() {
	pkgdesc+=' (client)'
	depends=('drawpile-common' 'karchive' 'qt5-multimedia')
	optdepends=('kdnssd: automatic service discovery (such as printers)'
		'giflib: GIF support'
		'miniupnpc: UPnP support'
		'qt5-color-widgets: alternative color wheel')
	cd "${pkgbase}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C 'build' install
	rm -rfv "${pkgdir}"/usr/{share,bin/drawpile-srv}
}

package_drawpile-server() {
	pkgdesc+=' (server)'
	depends=('drawpile-common' 'karchive')
	optdepends=('libmicrohttpd: web-admin feature (server dependency)'
		'libsystemd: systemd and logging support (server dependency)')
	cd "${pkgbase}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C 'build' install
	rm -rfv "${pkgdir}"/usr/{share,bin/drawpile{,-1.*}}
	#find "${pkgdir}/usr/bin" -not -type d -not -name 'drawpile-srv' -exec rm -f {} \;
}

package_drawpile-common() {
	pkgdesc+=' (common files)'
	arch=('any')
	depends=('desktop-file-utils')
	install="${pkgbase}.install"
	cd "${pkgbase}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C 'build' install
	rm -rfv "${pkgdir}/usr/bin"
	install -Dm644 "desktop/${pkgbase}.svg" \
		"${pkgdir}/usr/share/pixmaps/${pkgbase}.svg"
	install -Dm644 "desktop/${pkgbase}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgbase}.desktop"
}