# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgbase='drawpile'
pkgname=("${pkgbase}"{,'-client','-server','-common'})
pkgver=1.0.3
pkgrel=1
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('i686' 'x86_64')
url='http://drawpile.net/'
license=('GPL3')
makedepends=('karchive' 'qt5-multimedia' 'qt5-tools' 'qt5-svg' 'ninja' 'cmake')
source=("http://drawpile.net/files/src/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('d224543869039acaaaf7e3116332013acd81230f10efa80017d5af512281f7c9')

_cmakeargs+=('-Wno-dev')

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
	optdepends=('libmicrohttpd: web-admin feature'
		'libsystemd: systemd and logging support')
	cd "${pkgbase}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C 'build' install
	rm -rfv "${pkgdir}"/usr/{share,bin/drawpile{,-1.*}}
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