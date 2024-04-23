# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=apk-editor-studio-bin
_appname=application-vnd.android.package-archive
pkgver=1.7.1
pkgrel=2
pkgdesc="A powerful yet easy to use APK reverse-engineering tool"
arch=('x86_64')
provides=("${pkgname%-bin}")
url="https://qwertycube.com/apk-editor-studio/"
_ghurl='https://github.com/kefir500/apk-editor-studio'
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'java-runtime>=8'
    'android-sdk-build-tools'
    'android-sdk-platform-tools'
    'libusb'
    'android-apktool'
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
            '7b0831f35c90ccd21f71c30ba84a5f91371a12302afe6262df6ad7af66bd1e70')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	  install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib,plugins} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/mimetypes/${_appname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/mimetypes"
    done
}