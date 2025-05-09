# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-bin
_pkgname=Apifox
pkgver=2.7.9
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
    'nodejs'
    'python'
)
makedepends=(
    'fuse2'
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
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980'
            '3884df6451dd5aaadc867c2b6882a7feabccb10c7e1df98e48e9fe2414c9fe19')
sha256sums_aarch64=('0cdf0e763d14d69aa079fd5dc6bc99520c67a7d34ce027c68fac9e001a848ba4')
sha256sums_x86_64=('530096803d0c9d97f6b4d70cea6aa8a53ba7b58fc68b77397f15d155910f2e88')
pkgver() {
    cd "${srcdir}/squashfs-root"
    grep "X-AppImage-Version" "${pkgname%-bin}.desktop" | sed "s/X-AppImage-Version=//g"
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
    "${srcdir}/${_pkgname}"*.AppImage --appimage-extract > /dev/null
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