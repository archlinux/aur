# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beam-wallet-bin
_pkgname=Beam-Wallet
pkgver=7.5.13840.5763
pkgrel=4
pkgdesc="Beam Desktop Wallet.(Prebuilt version)"
arch=('x86_64')
url="https://beam.mw/"
_ghurl="https://github.com/BeamMW/beam-ui"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'gmp'
	'qt6-declarative'
	'alsa-lib'
	'nss'
)
makedepends=(
    'fuse2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/beam-${pkgver}/Linux-${_pkgname}-${pkgver}.zip"
	"${pkgname%-bin}.sh"
)
sha256sums=('ada4ac7a89eebca55c6ed3e49dad98174d014fd942dabaf13f2759ff3e035008'
            'b6df01eb77c2642ad958acb1c2183fc9761f9dc71f070d0e34211d318a160b87')
prepare() {
	sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname//-/}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${_pkgname}-${pkgver}.AppImage" ]; then
        chmod +x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
    fi
    "${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/\/usr\/bin\/${_pkgname//-/}/${pkgname%-bin}/g
        s/Icon=${pkgname%-wallet-appimage}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_pkgname//-/}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,libexec,plugins,qml,resources,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/beam.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/mimetypes/application-x-beam-dapp.png" \
		-t "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/x-beam-dapp.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/x-beam-dapp.xml" -t "${pkgdir}/usr/share/mime/packages"
}