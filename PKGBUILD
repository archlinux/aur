# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=cherry-studio
pkgname="${_appname}-electron-bin"
_pkgname=Cherry-Studio
pkgver=1.5.8
_electronversion=37
pkgrel=1
pkgdesc="🍒A desktop client that supports for multiple LLM providers.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://cherry-ai.com/"
_ghurl="https://github.com/CherryHQ/cherry-studio"
license=(
    'Apache-2.0'
    'LicenseRef-custom'
)
provides=("${_appname}=${pkgver}")
conflicts=("${_appname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
optdepends=(
    'ollama: Use your local LLM'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/CherryHQ/cherry-studio/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage")
sha256sums=('ca8950fcf72aef9d46e0bccc0b456c5e2e14bd37d2bbd04bb99632e09eda36b3'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('4c94391a758e20440924a57c401f069d44a5a6c0d7aa3b35271faadbd9401e3b')
sha256sums_x86_64=('01fc4c95d514ab9abc510d1657b4e2500d5d2118a78be3d6a404ca32aca474ad')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/squashfs-root/${_appname//-/}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname//-/}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_appname//-/}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_appname//-/}.desktop"
    rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/bufferutil/prebuilds/"{darwin-*,win32-*}
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname//-/}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname//-/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
