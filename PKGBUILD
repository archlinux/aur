# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=apk-editor-studio-bin
_appname=application-vnd.android.package-archive
pkgver=1.7.1
pkgrel=3
pkgdesc="A powerful yet easy to use APK reverse-engineering tool"
arch=('x86_64')
provides=("${pkgname%-bin}")
url="https://qwertycube.com/apk-editor-studio/"
_ghurl='https://github.com/kefir500/apk-editor-studio'
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'android-sdk-build-tools'
    'android-sdk-platform-tools'
    'libusb'
    'libglvnd'
    'libxcb'
    'libice'
    'libsm'
    'libx11'
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
sha256sums=('548cdee09e9951b577c0f2b9818ba90dbedef13ca4d57a7e20eab488c5ab1892'
            'b3e9c2ea2115387e381b4f66d286e59c0ad4a16b94eed5313b03ce05fadc8863')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	  install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib,plugins} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/mimetypes/${_appname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/mimetypes"
    done
}