# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
_appname="GitHub Desktop"
pkgname="${_pkgname}-zh-bin"
pkgver=3.4.8_linux1
#_zhpkgver="${pkgver%_linux2}"
_zhpkgver=3.4.8
_electronversion=30
pkgrel=1
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
sha256sums=('e38ea0b3d5a0fa5368a70d76b630dc62ad3a9a4ba1243a7bc25996f6f0aceb86'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('dded19a62f087d179f9676c6f900a8f23edfe9dc0df960b70c6972b0be84b3c3')
sha256sums_armv7h=('0cb4db9152f7a17a394f147b4bb955b41777540f1c00a4c41dc07493e8083231')
sha256sums_x86_64=('df0d8f3482021770aa7fd2790232c5a199cd8e0ec0519320495791184132348c')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm644 "${srcdir}/GithubDesktop汉化工具/Linux/"* -t "${srcdir}/usr/lib/${_pkgname}/resources/app"
    sed -e "
        5i\Name[zh_CN]=Github桌面版
        6i\Comment[zh_CN]=从桌面对Github进行简单协作
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
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
