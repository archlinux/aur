# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=forskscope
_gitname=forskscope
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Local-first cross-platform diff and merge tool"

pkgver=0.185.0
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

source=("LAUNCHER-${pkgver}.desktop::${_ghurlraw}/packaging/linux/${_appname}.desktop"
		"ICON-${pkgver}.png::${_ghurlraw}/docs/src/assets/logo.png"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"NOTICE-${pkgver}::${_ghurlraw}/NOTICE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${pkgver}/${_appname}-v${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('720e9852dc03d0f7241160a598785cf64a7001ea83be0e2ce127d886488d1b95'
            '35766d3d70744fb8fe544fa89e50592749003cc99e35b7d65a6b12a02002e692'
            'ea9c739abd3e9f46317b7b23f7e67e60e67828a30b10c21d7fe35a047be68165'
            'f651689716d7e61870c050334baf1bfc0e44a2fb8f39c68b2a1412de140f97fe'
            '8aa452d4de64938dbe60eb883a57780f7cb889a96db3c29aaa5fb9b9966de004')
sha256sums_x86_64=('1d7ba6ee55155fcca5e136906eea0bde44185f6805052724ff65478021b6427f')


prepare() {
	cd "${srcdir}/" || exit

	patchelf --replace-needed "libxdo.so.3" "libxdo.so.4" "${_appname}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LAUNCHER-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/icons/${_appname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "NOTICE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
