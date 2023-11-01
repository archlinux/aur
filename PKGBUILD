# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy-bin
_pkgname=Escrcpy
pkgver=1.11.9
pkgrel=1
pkgdesc="使用图形化的 Scrcpy 显示和控制您的 Android 设备，由 Electron 驱动"
arch=('aarch64' 'x86_64')
url="https://github.com/viarotel-org/escrcpy"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'bash'
    'electron27'
    'scrcpy'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
source=(
    "LICENSE::https://raw.githubusercontent.com/viarotel-org/escrcpy/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('e03f21dc67e766661667d3268c1ce5fbce9c32fb4b6e70281722bfbc9e3b7a7e'
            '941cb7196d03283a6e65a2271f0c8381a9ec8176f38ce9dc9916f3f89b29a720')
sha256sums_aarch64=('4125e0d4cec2351e993ae57ec47d08ccf86fd9f3529fd95727cf6ab3ea33918f')
sha256sums_x86_64=('a53a09d0afb30bf8710f285ff3a7a877152acba4c3c6f40564ad4c485fe7c0a9')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cd "${srcdir}/opt/${_pkgname}/resources/extra/linux"
    chmod 755 android-platform-tools/{adb,etc1tool,fastboot,hprof-conv,make_f2fs,make_f2fs_casefold,mke2fs,sqlite3} \
              gnirehtet/gnirehtet
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/extra/common/tray/icon.png" \
        -t "${pkgdir}/usr/lib/${pkgname%-bin}/extra/common/tray"
    cp -r "${srcdir}/opt/${_pkgname}/resources/extra/linux" "${pkgdir}/usr/lib/${pkgname%-bin}/extra"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}