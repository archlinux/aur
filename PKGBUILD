# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=forskscope
_gitname=forskscope
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Local-first cross-platform diff and merge tool"

pkgver=0.196.0
pkgrel=1

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${pkgver}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('patchelf')
depends=('git' 'webkit2gtk-4.1' 'glib2' 'gtk3' 'gdk-pixbuf2' 'xdotool' 'openssl' 'libsoup3' 'cairo')

options=('!strip')

source=("METAINFO-${pkgver}.xml::${_ghurlraw}/packaging/linux/io.github.${_appname}.${_appname}.metainfo.xml"
		"LAUNCHER-${pkgver}.desktop::${_ghurlraw}/packaging/linux/io.github.${_appname}.${_appname}.desktop"
		"ICON-${pkgver}.png::${_ghurlraw}/docs/src/assets/logo.png"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"NOTICE-${pkgver}::${_ghurlraw}/NOTICE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${pkgver}/${_appname}-v${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('292fcee63ffc518e09014ddbe7443fdad3a64bceeb716e0e32b870227beca46d'
            '97c10a7bfa6618a1b4d2ac601799d3a04abc7e57f299ba1fa3999ad01626b839'
            '35766d3d70744fb8fe544fa89e50592749003cc99e35b7d65a6b12a02002e692'
            '4d2ed25a5656133f801a397c9a566504bd3ea467ad1f5a8968c9c2660b55de17'
            'f651689716d7e61870c050334baf1bfc0e44a2fb8f39c68b2a1412de140f97fe'
            '8aa452d4de64938dbe60eb883a57780f7cb889a96db3c29aaa5fb9b9966de004')
sha256sums_x86_64=('fd158f42cbcbfb0ad2b4b69469332ede0b7cc2f5863f1b5d44239d2dd89f4a7c')


prepare() {
	cd "${srcdir}/" || exit

	patchelf --replace-needed "libxdo.so.3" "libxdo.so.4" "${_appname}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LAUNCHER-${pkgver}.desktop" "${pkgdir}/usr/share/applications/io.github.${_appname}.${_appname}.desktop"
	install -Dm644 "METAINFO-${pkgver}.xml" "${pkgdir}/usr/share/metainfo/io.github.${_appname}.${_appname}.metainfo.xml"
	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/icons/io.github.${_appname}.${_appname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "NOTICE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
