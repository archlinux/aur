# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
_appname=GitHubDesktop
pkgname="${_pkgname}-zh-bin"
pkgver=3.3.1
_zhpkgver=3.3.0
pkgrel=1
pkgdesc="GUI for managing Git and GitHub.Chinese SC Version.Github Desktop 汉化版"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://desktop.github.com"
_githuburl="https://github.com/shiftkey/desktop"
_githubzhurl="https://github.com/robotze/GithubDesktopZhTool"
license=('MIT')
depends=('hicolor-icon-theme' 'libsecret' 'perl' 'curl' 'libxfixes' 'libxkbcommon' 'libxrandr' 'glibc' 'pango' 'at-spi2-core' 'nspr' 'libxcomposite' \
    'libcups' 'alsa-lib' 'dbus' 'libdrm' 'expat' 'zlib' 'gcc-libs' 'cairo' 'libxcb' 'libxext' 'glib2' 'libx11' 'libxdamage' 'nss' 'gtk3' 'mesa' 'bash')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-zh}")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/release-${pkgver}-linux1/${_appname}-linux-amd64-${pkgver}-linux1.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/release-${pkgver}-linux1/${_appname}-linux-armhf-${pkgver}-linux1.deb")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/release-${pkgver}-linux1/${_appname}-linux-amd64-${pkgver}-linux1.deb")
source=("${_pkgname}-${_zhpkgver}-zh.7z::${_githubzhurl}/releases/download/${_zhpkgver}/${_appname}.7z"
    "LICENSE::https://raw.githubusercontent.com/shiftkey/desktop/linux/LICENSE")
sha256sums=('5de80e4890b5e28eb3ed7d9cf7f190debff69c544b5dec4c0ce7fe77f0e14322'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530')
sha256sums_aarch64=('03e0b5bd10499408cf0a1c1c5117657a8bd97da2de3330e6936b5b5753b99df7')
sha256sums_armv7h=('5aa578284a4e797da10f1cbc8455b537a08160c73cf0e193a87801a5b18df40a')
sha256sums_x86_64=('03e0b5bd10499408cf0a1c1c5117657a8bd97da2de3330e6936b5b5753b99df7')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    echo -e "Name[zh_CN]=Github桌面版" >> "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    echo -e "Comment[zh_CN]=从桌面版对Github进行简单协作" >> "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed "s|${_pkgname} %U|${pkgname%-bin} %U --no-sandbox|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname%-bin},usr/bin}
    cp -r "${srcdir}/usr/lib/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/GithubDesktop汉化工具/Linux/"*.js -t "${pkgdir}/opt/${pkgname%-bin}/resources/app"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}