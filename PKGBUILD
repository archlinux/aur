# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beam-wallet-bin
_pkgname=Beam-Wallet
pkgver=7.5.14548.5873
pkgrel=1
pkgdesc="Beam Desktop Wallet.(Prebuilt version)"
arch=('x86_64')
url="https://beam.mw/"
_ghurl="https://github.com/BeamMW/beam-ui"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'qt6-declarative'
    'qt6-webengine'
    'qt6-webchannel'
    'qt6-5compat'
	'alsa-lib'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/beam-${pkgver}/Linux-${_pkgname}-${pkgver}.zip"
	"${pkgname%-bin}.sh"
)
sha256sums=('9a887b78f1f04049d88949302aa4c0ad0aab9b12d0f009ceeb17798fd774c143'
            '216b754c5be3b7d33ebc915743a3bc4d6663a63b0a07468c88cc26bf20908cb4')
prepare() {
	sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname//-/}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    rm -rf "${srcdir}/squashfs-root"
    chmod +x "${srcdir}/"*.AppImage
    "${srcdir}/"*.AppImage --appimage-extract > /dev/null
    sed -i -e "
        s/\/usr\/bin\/${_pkgname//-/}/${pkgname%-bin}/g
        s/Icon=${pkgname%-wallet-appimage}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_pkgname//-/}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/usr/"{bin,lib,libexec,plugins,qml,resources,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/beam.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/mimetypes/application-x-beam-dapp.png" \
		-t "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/x-beam-dapp.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/x-beam-dapp.xml" -t "${pkgdir}/usr/share/mime/packages"
}
