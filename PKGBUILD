# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=znote-bin
pkgver=3.7.5
_electronversion=36
pkgrel=1
pkgdesc="A Beautiful markdown editor inspired by Jupyter.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://znote.io"
_ghurl="https://github.com/alagrede/znote-app"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage")
source=(
    "LICENSE-${pkgver}.html::${url}/cgu.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('65dff9c234613d5ca892f8a52b54de23fcf3b9f996d51651bc611aca239ef606'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('c9f3060aa2b2f89368ba6a57258ec00764e5a2ee3545188203bcf2eb47cc1895')
sha256sums_x86_64=('27c441f89f58364b07600f1c3b7bf14f50f8d7c1aabb99f9e756c7ac0828d800')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/squashfs-root/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -perm 700 -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    _icon_sizes=(8x8 32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
