# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=htbrowser-bin
pkgver=5.0.2.21
pkgrel=1
pkgdesc="红莲花国密浏览器是政企专用浏览器，支持国产密码算法，全面适配信创环境，可以提供国产密码改造服务，既满足安全可靠又保障自主可控的浏览器使用需求。"
arch=(
    'aarch64'
    'x86_64'
)
url="http://www.haitaibrowser.com"
_downurl="https://haitaibrowser.com:20003/download"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nss'
    'libxrandr'
    'libdrm'
    'libxshmfence'
    'gtk2'
    'libcups'
    'libxcomposite'
    'expat'
    'gdk-pixbuf2'
    'libxext'
    'cairo'
    'hicolor-icon-theme'
    'libxdamage'
    'libxfixes'
    'alsa-lib'
    'libxcb'
    'mesa'
    'at-spi2-core'
    'libx11'
    'pango'
    'nspr'
    'freetype2'
    'libglvnd'
    'fontconfig'
    'xdg-utils'
)
options=(
    '!emptydirs'
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_downurl}/${pkgname%-bin}_l_arm_uos_${pkgver}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_downurl}/${pkgname%-bin}_l_x86_uos_${pkgver}.deb")
source=(
    "LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c74e69c2dd5cd4543f078bce866947b1f6fdf9eea2de843810f0a6b89ee76f3f'
            'cfae4c473975db0c39ffeafdd4159b436f814d4204fd152d182a91618710caef')
sha256sums_aarch64=('65037262aa27d692c964155919f969286fb706d5cb77eed04883e74bdd50c06f')
sha256sums_x86_64=('a09f7741801e0231eaa83ed569cb9e9a789be9fc0c22e12e9a8a4e882c9d125f')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/apps/${pkgname%-bin}/${pkgname%-bin}.sh|${pkgname%-bin}|g;s|/opt/apps/${pkgname%-bin}/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm755 -d "${srcdir}/opt/apps/${pkgname%-bin}/swiftshader"
    mv "${srcdir}/opt/apps/${pkgname%-bin}/libGLESv2.so" "${srcdir}/opt/apps/${pkgname%-bin}/swiftshader"
    mv "${srcdir}/opt/apps/${pkgname%-bin}/libEGL.so" "${srcdir}/opt/apps/${pkgname%-bin}/swiftshader"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/opt/apps/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 24x24 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/man/man1/${pkgname%-bin}.1.gz" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}