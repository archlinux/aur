# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tts-vue
pkgver=1.9.15
pkgrel=3
pkgdesc="Microsoft speech synthesis tool, built using Electron+Vue+ElementPlus+Vite.微软语音合成工具,使用Electron+Vue+ElementPlus+Vite构建。"
arch=('x86_64')
url="https://tts-doc.loker.vip/home.html"
_ghurl="https://github.com/LokerL/tts-vue"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'libdrm'
    'mesa'
    'expat'
    'nss'
    'cairo'
    'gtk3'
    'libxcb'
    'nspr'
    'pango'
    'libxkbcommon'
    'at-spi2-core'
    'libxcomposite'
    'libxdamage'
    'libx11'
    'libxrandr'
    'alsa-lib'
    'libcups'
    'libxext'
    'libxfixes'
)
makedepends=(
    'gendesk'
    'nodejs>=14.17.0'
    'npm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=${pkgver}"
)
sha256sums=('SKIP')
build() {
    gendesk -q -f -n --categories "Utility" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm i --cache "${srcdir}/npm-cache"
    npm run build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/${pkgver}/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/node.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}