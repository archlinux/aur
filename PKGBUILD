# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=campuslivre
_gitname=matlivre
_appname=MatLivre
pkgname=${_appname,,}-bin
pkgdesc="A fast live script editor and runtime for MATLAB code."

pkgver=0.1.7
pkgrel=2
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
depends=('glibc' 'libgcc' 'libx11' 'libxcursor' 'libxi' 'libxkbcommon-x11' 'wayland' 'libglvnd' 'hicolor-icon-theme')
optdepends=('xdg-desktop-portal: file dialogs (requires a desktop portal backend)'
			'ttf-dejavu: text fonts for figure exports')

options=('!strip')

source=("LAUNCHER-${pkgver}.desktop::${_ghurlraw}/tools/linux/${_appname,,}.desktop"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_appname,,}.xml")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.AppImage::${_ghurl}/releases/download/${_gitversion}/${_appname,,}.AppImage")
sha256sums=('8ed74d1b1a66388fbf7574362b6d285e611ac13c9e03d06a808c5c78cf83fea6'
            '3288b47285918889ce0d5a2024993db1111d922376798bbbe30c57fa53e7730d'
            '63d91bd964e2a05a54f39d2f70ba9f5f9308146e858382f90bc7486bca3e5d7b'
            'dce2978f4a1507f4307b59f2946c491e2441c33a4524e5ae6078888cf9460681')
sha256sums_x86_64=('dc0e66bef6e1cabcabb6f7e0c8de7847b762e0b874bd2f233a7a5c4ece610934')

_appimagefile="${_appname}-${CARCH}-${pkgver}.AppImage"
_root='squashfs-root'

prepare() {
	cd "${srcdir}/" || exit

	msg2 'Extracting the AppImage (This may take some time)... '

	chmod +x "${_appimagefile}"

	./"${_appimagefile}" --appimage-extract

	cp -rf "${_appname,,}.xml" "${_root}/${_appname,,}.xml"

	cp -rf "LAUNCHER-${pkgver}.desktop" "${_root}/${_appname,,}.desktop"
}

package() {
	cd "${srcdir}/${_root}/" || exit

	install -Dm755 "usr/bin/${_appname,,}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname,,}.xml" -t "${pkgdir}/usr/share/mime/packages/"

	install -Dm644 "${_appname,,}.desktop" -t "${pkgdir}/usr/share/applications/"

	install -Dm644 "${_appname,,}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
