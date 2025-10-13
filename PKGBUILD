# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-bin
_pkgname=Apifox
# 从以下网址确定版本 https://docs.apifox.com/changelog
pkgver=2.7.42
_electronversion=28
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter(Prebuilt version.Use system-wide electron).API 文档、API 调试、API Mock、API 自动化测试"
arch=(
    'aarch64'
    'x86_64'
)
url="https://apifox.com/"
_ghurl="https://github.com/apifox/apifox"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
    'libxcrypt-compat'
    'python'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}.sh"
    "LICENSE.html"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::https://file-assets.apifox.com/download/${_pkgname}-linux-arm64-latest.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::https://file-assets.apifox.com/download/${_pkgname}-linux-latest.zip")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6'
            '3884df6451dd5aaadc867c2b6882a7feabccb10c7e1df98e48e9fe2414c9fe19')
sha256sums_aarch64=('122c20500748f882d9fe26a3602527ea512b2536137306ab6989b2ea252980b3')
sha256sums_x86_64=('5eab5774cbeef0840cb51d4c993dafcda8a25cdcbd5405c2e80bd7c802bb466a')
pkgver() {
    cd "${srcdir}/squashfs-root"
    grep "X-AppImage-Version" "${pkgname%-bin}.desktop" | sed "s/X-AppImage-Version=//g"
}
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
    if [ ! -x "${srcdir}/${_pkgname}"*.AppImage ];then
        chmod +x "${srcdir}/${_pkgname}"*.AppImage
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${_pkgname}"*.AppImage --appimage-extract > /dev/null
    _get_electron_version
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules" -type d -name ".github" -exec rm -rf {} +
    rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/oracledb/build/Release/"{*darwin*,*win32*}
    ln -sf "/usr/bin/python" "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/cpu-features/build/node_gyp_bins/python3"
    ln -sf "/usr/bin/python" "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/nodejieba/build/node_gyp_bins/python3"
    find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}