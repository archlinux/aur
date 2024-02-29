# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aechoterm-bin
_pkgname=Aechoterm
pkgver=4.0.1
_electronversion=13
pkgrel=4
pkgdesc="A free, cross-platform terminal and file management tool for accessing remote servers with SSH and SFTP protocols.闪令是一款免费的、跨平台的,以SSH、SFTP协议访问远程服务器的终端、文件管理工具"
arch=(
    'aarch64'
    'x86_64'
)
url="https://ec.nantian.com.cn/"
_ghurl="https://github.com/Aechoterm/Aechoterm"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'java-runtime'
    'python'
    'nodejs'
)
options=('!strip')
source=(
    "LICENSE.html::${url}/privacy-agreement.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://ec.cnd.nantiangzzx.com/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://ec.cnd.nantiangzzx.com/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('cc65895a835817a900c9c2c4006a1738a6f2284cfa29eeb8283fd0043121931e'
            'f80acf84a87f3f50d7c4e2ed22f4d0e8b09dd98a6c26253f2524e5413771eab1')
sha256sums_aarch64=('5ad55272b26a667cfcca3cc8c31b0afdabae8c718694b645cb19c83dc7387838')
sha256sums_x86_64=('c3cd799babbfca9a6c367891ed8612279bb59dd78ff93a374c304e9f69d78d43')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin} --no-sandbox|${pkgname%-bin}|g;s|Development|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}