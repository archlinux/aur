# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beam-wallet-bin
_pkgname=Beam-Wallet
pkgver=7.5.14493.5867
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
sha256sums=('8970068fda20002647eb04ce939a3c5b984375f3a3b8b0e85d72f00f1ed9cd77'
            'b6df01eb77c2642ad958acb1c2183fc9761f9dc71f070d0e34211d318a160b87')
prepare() {
	sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname//-/}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/Linux-${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.AppImage" ]; then
        chmod +x "${srcdir}/Linux-${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/Linux-${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
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
