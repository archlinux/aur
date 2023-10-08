# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
_appname=GitHubDesktop
pkgname="${_pkgname}-zh-bin"
pkgver=3.3.3
_zhpkgver="${pkgver}"
pkgrel=1
pkgdesc="GUI for managing Git and GitHub.Chinese SC Version.Github Desktop 汉化版"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://desktop.github.com"
_githuburl="https://github.com/shiftkey/desktop"
_githubzhurl="https://github.com/robotze/GithubDesktopZhTool"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-zh}")
depends=('hicolor-icon-theme' 'libxfixes' 'libxkbcommon' 'libxrandr' 'glibc' 'pango' 'at-spi2-core' 'nspr' 'libxcomposite' \
    'libcups' 'alsa-lib' 'dbus' 'libdrm' 'expat' 'gcc-libs' 'cairo' 'libxcb' 'libxext' 'glib2' 'libx11' 'libxdamage' 'nss' 'gtk3' 'mesa')
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/release-${pkgver}-linux1/${_appname}-linux-arm64-${pkgver}-linux1.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/release-${pkgver}-linux1/${_appname}-linux-armhf-${pkgver}-linux1.deb")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/release-${pkgver}-linux1/${_appname}-linux-amd64-${pkgver}-linux1.deb")
source=("${_pkgname}-${_zhpkgver}-zh.7z::${_githubzhurl}/releases/download/${_zhpkgver}/${_appname}.7z"
    "LICENSE::https://raw.githubusercontent.com/shiftkey/desktop/release-${pkgver}-linux1/LICENSE")
sha256sums=('089b1e9396edd646ecc60f25147a0acd2b028b1ca89a73b2e13eefcf10bc45ef'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530')
sha256sums_aarch64=('387c8a4048805350922a3fabb0710c181fc7d5feddae451dd4e9f9841653a5c6')
sha256sums_armv7h=('ae41a6166d3bda94c5c6f971eb325147b89b68512718ade27770be59639864b9')
sha256sums_x86_64=('2bc40d601f1a0d0b731e1897eb99005ec755926835634f82fc8cb9b8cd29c58e')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm644 "${srcdir}/GithubDesktop汉化工具/Linux/"*.js -t "${srcdir}/usr/lib/${_pkgname}/resources/app"
    echo -e "Name[zh_CN]=Github桌面版" >> "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    echo -e "Comment[zh_CN]=从桌面版对Github进行简单协作" >> "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed "s|${_pkgname} %U|${pkgname%-bin} %U --no-sandbox|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/usr/lib/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}