# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beam-wallet-bin
_pkgname="Beam-Wallet"
pkgver=7.5.13840.5763
pkgrel=1
pkgdesc="Beam Desktop Wallet"
arch=('x86_64')
url="https://beam.mw/"
_ghurl="https://github.com/BeamMW/beam-ui"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'hicolor-icon-theme'
	'gmp'
	'qt6-declarative'
	'alsa-lib'
	'nss'
)
makedepends=(
    'squashfuse'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/beam-${pkgver}/Linux-${_pkgname}-${pkgver}.zip"
	"${pkgname%-bin}.sh"
)
sha256sums=('ada4ac7a89eebca55c6ed3e49dad98174d014fd942dabaf13f2759ff3e035008'
            '2bb166f660981dbadbeb2d3cf32abbff9000778ce8e434f89db86e0359b45a49')
build() {
	sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname//-/}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|/usr/bin/${_pkgname//-/}|${pkgname%-bin}|g;s|Icon=${pkgname%-wallet-appimage}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_pkgname//-/}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib,libexec,plugins,qml,resources,translations} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/beam.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/mimetypes/application-x-beam-dapp.png" \
		-t "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/x-beam-dapp.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/x-beam-dapp.xml" -t "${pkgdir}/usr/share/mime/packages"
}