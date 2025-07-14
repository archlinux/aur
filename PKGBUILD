# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
_appname="GitHub Desktop"
pkgname="${_pkgname}-zh-bin"
pkgver=3.4.13_linux1
#_zhpkgver="${pkgver%_linux2}"
_zhpkgver=3.5.1
_electronversion=32
pkgrel=7
pkgdesc="GUI for managing Git and GitHub.Chinese SC Version.(Use system-wide electron).Github Desktop 汉化版."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://desktop.github.com"
_ghurl="https://github.com/shiftkey/desktop"
_ghzhurl="https://github.com/robotze/GithubDesktopZhTool"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
    'libsecret'
    'perl'
    'curl'
    'expat'
)
options=('!strip')
source_aarch64=("${_pkgname}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/release-${pkgver//_/-}/${_appname// /}-linux-aarch64-${pkgver//_/-}.rpm")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/release-${pkgver//_/-}/${_appname// /}-linux-armv7l-${pkgver//_/-}.rpm")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/release-${pkgver//_/-}/${_appname// /}-linux-x86_64-${pkgver//_/-}.rpm")
source=(
    "${_pkgname}-${_zhpkgver}-zh.7z::${_ghzhurl}/releases/download/${_zhpkgver}/${_appname// /}.7z"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/shiftkey/desktop/release-${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('05080a5fa8b41d28f2e196912f2520b60d55d1171746a71f9c7a5bbd2398c7dd'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
sha256sums_aarch64=('8914f985013da02e36de63b65fc252dc86fd9326497f0cf3f49402017fe1006f')
sha256sums_armv7h=('e7245fc83d8f7a4be854e43e6441c6932d7d4702dfa3b38cf16c56442ed295a1')
sha256sums_x86_64=('ad83b9b5b036a404ede0d5f0a147d46967dd0605a428da6b1876bdb37555d963')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/usr/lib/${_pkgname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    install -Dm644 "${srcdir}/GithubDesktop汉化工具/Linux/"* -t "${srcdir}/usr/lib/${_pkgname}/resources/app"
    sed -i -e "
        5i\Name[zh_CN]=Github桌面版
        6i\Comment[zh_CN]=从桌面对Github进行简单协作
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    _icon_sizes=(32x32 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}
