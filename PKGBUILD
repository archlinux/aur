# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: zhullyb <zhullyb [at] outlook dot com>
pkgname=wolai-bin
pkgver=1.2.10
_electronversion=22
pkgrel=1
pkgdesc="wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生产力工具。"
arch=(
    "aarch64"
    "x86_64"
)
url="https://www.wolai.com"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_amd64.deb")
source=(
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('04b7a1e4cecbadd2e1bc903b3ad518834f93b9b76542bf53fcb18f24faac099c'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('18e7f956b85e0396320ee938455c80e16446d267a5c7b35268f9d046d8cd86b7')
sha256sums_x86_64=('512b11d5f9a743e59bb188eb2179bcfdd2313c81c0ac1f6a60cf1936cb7c0636')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|(resourcesPath,|(\"\/usr\/lib\/${pkgname%-bin}\",|g" -i "${srcdir}/app.asar.unpacked/packages/main/dist/index.cjs"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/"{app.asar.unpacked,buildResources} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}