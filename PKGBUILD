# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=campuslivre
_gitname=matlivre
_appname=MatLivre
pkgname=${_appname,,}-bin
pkgdesc="A fast live script editor and runtime for MATLAB code."

pkgver=0.1.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname,,}")
conflicts=("${pkgname%-bin}")

makedepends=('libappimage')
depends=('glibc' 'libgcc' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.AppImage::${_ghurl}/releases/download/${_gitversion}/${_appname,,}.AppImage")
sha256sums=('3288b47285918889ce0d5a2024993db1111d922376798bbbe30c57fa53e7730d'
            '63d91bd964e2a05a54f39d2f70ba9f5f9308146e858382f90bc7486bca3e5d7b')
sha256sums_x86_64=('dc0e66bef6e1cabcabb6f7e0c8de7847b762e0b874bd2f233a7a5c4ece610934')

_appimagefile="${_appname}-${CARCH}-${pkgver}.AppImage"
_root='squashfs-root'

prepare() {
	cd "${srcdir}/" || exit

	msg2 'Extracting the AppImage (This may take some time)... '

	chmod +x "${_appimagefile}"

	./"${_appimagefile}" --appimage-extract

	sed -e "s|Comment=${_appname} ${pkgver}|Comment=${_appname}|g" -i ${_root}/${_appname,,}.desktop
}

package() {
	cd "${srcdir}/${_root}/" || exit

	install -Dm755 "usr/bin/${_appname,,}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname,,}.desktop" -t "${pkgdir}/usr/share/applications/"

	install -Dm644 "${_appname,,}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
