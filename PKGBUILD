# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgbase='drawpile'
pkgname=("${pkgbase}"{,'-client','-server','-common'})
pkgver=2.0.11
pkgrel=1
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('i686' 'x86_64')
url='http://drawpile.net/'
license=('GPL3')
makedepends=('karchive' 'qt5-multimedia' 'qt5-tools' 'qt5-svg' 'ninja' 'cmake')
source=("http://drawpile.net/files/src/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('f34a9be3414dca26d059e292e994eaa05932cca70a465a39be9c02067b460140')

_cmakeargs+=('-Wno-dev' '-DKIS_TABLET=ON')

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
	depends=("${pkgbase}-client" "${pkgbase}-server")
}

package_drawpile-client() {
	pkgdesc+=' (client)'
	depends=("${pkgbase}-common" 'karchive' 'qt5-multimedia')
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
	depends=("${pkgbase}-common" 'karchive')
	optdepends=('libmicrohttpd: web-admin feature'
		'libsystemd: systemd and logging support')
	cd "${pkgbase}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C 'build' install
	rm -rfv "${pkgdir}"/usr/{share,bin/drawpile{,-2.*}}
}

package_drawpile-common() {
	pkgdesc+=' (common files)'
	arch=('any')
	depends=('desktop-file-utils')
	install="${pkgbase}.install"
	cd "${pkgbase}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C 'build' install
	rm -rfv "${pkgdir}/usr/bin"
	install -Dvm644 "desktop/${pkgbase}.svg" \
		"${pkgdir}/usr/share/pixmaps/${pkgbase}.svg"
	install -Dvm644 "desktop/${pkgbase}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgbase}.desktop"
}
