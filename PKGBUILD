# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=apk-editor-studio-bin
_appname=application-vnd.android.package-archive
pkgver=1.7.2
pkgrel=2
pkgdesc="A powerful yet easy to use APK reverse-engineering tool.(Prebuilt version)"
arch=('x86_64')
provides=("${pkgname%-bin}")
url="https://qwertycube.com/apk-editor-studio/"
_ghurl="https://github.com/kefir500/apk-editor-studio"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libusb'
    'libglvnd'
    'libxcb'
    'libice'
    'libsm'
    'libx11'
    'java-runtime'
)
makedepends=(
    'fuse2'
)
optdepends=(
    'libsecret: Enable password manager backend'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('4b20d5ea5fd9cfab3810600c9b1c07398705d90ef4a36bba1c9f7f32f7ee7027'
            'b3e9c2ea2115387e381b4f66d286e59c0ad4a16b94eed5313b03ce05fadc8863')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/share/${pkgname%-bin}" "${pkgdir}/usr/share"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/mimetypes/${_appname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/mimetypes"
    done
}