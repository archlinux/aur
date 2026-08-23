# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gekap
_gitname=blitcp
_appname=${_gitname}
pkgbase=${_appname}-bin
pkgname=(${_appname}-bin ${_appname}-gui-bin)
pkgdesc="Fast file copier with SSH streaming, deduplication & block-order I/O"

pkgver=4.0.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

depends=('glibc' 'zlib' 'xxhash' 'python-xxhash' 'python-paramiko')

options=('!strip')

source=("ICON-${pkgver}.png::${_ghurlraw}/assets/${_appname}-logo.png"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-linux"
			   "${_appname}-gui-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_gui-linux")
sha256sums=('a24c52f69fb0055d6c9c07ee4dac6221b9627e1a0283bb7d7b2c60043a945a1d'
            '59026d6212d42649ec67801c24442e9fa06f8ce7a07c4a20fce3e9b0f4f86410'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('fafaa2ff2f57ff4577181206d12a31ca906ef8195a36bd68695425861af54f0b'
                   '0ecfd8c3c2d81c1f373face3ce9cc14fce0f47972819aabc83c686865850f1ab')


package_blitcp-bin() {
	provides=("${_appname}")
	conflicts+=("${pkgname%-bin}")
	optdepends+=("${_appname}-gui")

	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_blitcp-gui-bin() {
	depends=("${_appname}")
	provides=("${_appname}-gui")
	conflicts+=("${pkgname%-bin}")

	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-gui-${pkgver}" "${pkgdir}/usr/bin/${_appname}-gui"

	install -Dm755 /dev/stdin "${pkgdir}/usr/share/applications/${_appname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=${_appname}
Comment=${pkgdesc}
Exec=/usr/bin/${_appname}-gui %U
Icon=${_appname}
Terminal=false
Categories=Utility;
MimeType=x-scheme-handler/${_appname};
StartupWMClass=${_appname}
EOF

	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/icons/${_appname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
