# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gekap
_gitname=blitcp
_appname=${_gitname}
pkgbase=${_appname}-bin
pkgname=(${_appname}-bin ${_appname}-gui-bin)
pkgdesc="Fast file copier with SSH streaming, deduplication & block-order I/O"

pkgver=4.1.6
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
            'c8d109788d50bd47b0508b2e521c475bf0d0093fb3726e801ce167a9c27084b9'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('d531aa688d248f3cf61526e1c29e7c9756d42a7fd548249caa97e66407d68b12'
                   'b5b58e33096f5f8a9a2afe2ddad57214bd9a7d85f7cbb0ebfe3d9e7ce13c5196')


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
