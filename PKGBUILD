# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
_appname=GitHubDesktop
pkgname="${_pkgname}-zh-bin"
pkgver=3.3.5_linux2
_zhpkgver="${pkgver%_linux2}"
#_zhpkgver=3.3.5
pkgrel=1
pkgdesc="GUI for managing Git and GitHub.Chinese SC Version.Github Desktop 汉化版"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://desktop.github.com"
_githuburl="https://github.com/shiftkey/desktop"
_githubzhurl="https://github.com/robotze/GithubDesktopZhTool"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-zh}")
depends=(
    'hicolor-icon-theme'
    'bash'
    'electron26'
    'libsecret'
    'perl'
    'curl'
    'expat'
)
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/release-${pkgver//_/-}/${_appname}-linux-arm64-${pkgver//_/-}.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/release-${pkgver//_/-}/${_appname}-linux-armhf-${pkgver//_/-}.deb")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/release-${pkgver//_/-}/${_appname}-linux-amd64-${pkgver//_/-}.deb")
source=(
    "${_pkgname}-${_zhpkgver}-zh.7z::${_githubzhurl}/releases/download/${_zhpkgver}/${_appname}.7z"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/shiftkey/desktop/release-${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('583b614389c03ae83b0099c76233183836fac8c136409bb957a17fd31ee1a6b6'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530'
            'af2c7520372be84048540ce80ecd61f30154071f8947e4b76698de7c3e4cf520')
sha256sums_aarch64=('72a17980515c707488fff7195bbed30fd6f701fdeccbf4d69f73ab8ca6860d93')
sha256sums_armv7h=('50fa487561001a26d9770e5af818d167e591f55e9fe656c64bf8939db58b6c33')
sha256sums_x86_64=('1bedd13b85e60a18ee0aa9bf23b6a0f07368d80d95927c3db09ac0881b22a2ce')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm644 "${srcdir}/GithubDesktop汉化工具/Linux/"*.js -t "${srcdir}/usr/lib/${_pkgname}/resources/app"
    sed -e "5i\Name[zh_CN]=Github桌面版" \
        -e "6i\Comment[zh_CN]=从桌面版对Github进行简单"${pkgver}"协作" \
        -e "s|${_pkgname} %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for _icons in 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}