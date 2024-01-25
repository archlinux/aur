# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
_appname=GitHubDesktop
pkgname="${_pkgname}-zh-bin"
pkgver=3.3.6_linux3
#_zhpkgver="${pkgver%_linux2}"
_zhpkgver=3.3.8
_electronversion=26
pkgrel=2
pkgdesc="GUI for managing Git and GitHub.Chinese SC Version.Github Desktop 汉化版"
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
conflicts=("${_pkgname}" "${pkgname%-zh}")
depends=(
    'hicolor-icon-theme'
    "electron${_electronversion}"
    'libsecret'
    'perl'
    'curl'
    'expat'
)
options=('!strip')
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/release-${pkgver//_/-}/${_appname}-linux-arm64-${pkgver//_/-}.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/release-${pkgver//_/-}/${_appname}-linux-armhf-${pkgver//_/-}.deb")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/release-${pkgver//_/-}/${_appname}-linux-amd64-${pkgver//_/-}.deb")
source=(
    "${_pkgname}-${_zhpkgver}-zh.7z::${_ghzhurl}/releases/download/${_zhpkgver}/${_appname}.7z"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/shiftkey/desktop/release-${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ae9477be564f83ad64af64de563cd81565d84b6a4fe68e93077c72c4e12f1133'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
sha256sums_aarch64=('2c1faf2dbfff1c69cadf1b4ace7bae20fb64b492298698e2bfa56482e6f8a584')
sha256sums_armv7h=('10d0220438d04983d8dd01a12d9c44c8616244fb3a31f0152f85a8809c3fea73')
sha256sums_x86_64=('f74d0985f1cdefc0ae017a6d3d7d93a13bd3f44fa0fb1457aa6966df827d97a9')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm644 "${srcdir}/GithubDesktop汉化工具/Linux/"* -t "${srcdir}/usr/lib/${_pkgname}/resources/app"
    sed -e "5i\Name[zh_CN]=Github桌面版" \
        -e "6i\Comment[zh_CN]=从桌面对Github进行简单协作" \
        -e "s|Exec=${_pkgname}|Exec=${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
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