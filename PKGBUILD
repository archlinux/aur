# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy-bin
_pkgname=Escrcpy
pkgver=1.23.5
_electronversion=30
pkgrel=1
pkgdesc="使用图形化的 Scrcpy 显示和控制您的 Android 设备，由 Electron 驱动"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/viarotel-org/escrcpy"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'scrcpy'
)
makedepends=(
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('a7bf8065a3b3dee53c8ab98f8f84a9f3d40643c46e1a1b1bd812c8ba26fb0628')
sha256sums_x86_64=('0b89d596c68218f127676d84c2cbb50099e41508d2a07ef6de4030b15962813a')
build() {
    sed -e "
        s|@electronversion@|${_electronversion}|g
        s|@appname@|${pkgname%-bin}|g
        s|@runname@|app.asar|g
        s|@cfgdirname@|${pkgname%-bin}|g
        s|@options@||g
        " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cd "${srcdir}/opt/${_pkgname}/resources/extra/linux"
    chmod 755 android-platform-tools/{adb,etc1tool,fastboot,hprof-conv,make_f2fs,make_f2fs_casefold,mke2fs,sqlite3} \
              gnirehtet/gnirehtet
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/"{dist,dist-electron} -type f -exec sed -i "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" {} \;
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/extra/common/tray/icon.png" \
        -t "${pkgdir}/usr/lib/${pkgname%-bin}/extra/common/tray"
    cp -r "${srcdir}/opt/${_pkgname}/resources/extra/linux" "${pkgdir}/usr/lib/${pkgname%-bin}/extra"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}