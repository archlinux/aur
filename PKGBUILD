# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
_appname=GitHubDesktop
pkgname="${_pkgname}-zh-bin"
pkgver=3.3.10_linux1
#_zhpkgver="${pkgver%_linux2}"
_zhpkgver=3.3.12
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
conflicts=(
    "${_pkgname}"
    "${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}-bin"
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
sha256sums=('93e5833ed499a04965893959c95671572bae8331cb8fab08d303a4569f28b9d2'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('aec957d95ec694113a650395a7e71f37d469192c3364358fe5b9b6fe44ed853a')
sha256sums_armv7h=('fd1340f570d06cdb6ef7652a49fc475ced8bbe2511af7f97359c2a7ebba2491f')
sha256sums_x86_64=('cf3abaa7f0c0426812c38280518aadad02a420f92c2f39144231b3c0edba5a04')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
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