# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=aero
pkgname="${_appname}-browser"
_pkgname="Aero Browser"
pkgver=0.2.1_alpha
pkgrel=1
pkgdesc="A fast and lightweight web browser made with electron and react that allows you to navigate the Internet with ease."
arch=('any')
url="https://aero-mymeiy532-frostbreker.vercel.app/"
_ghurl="https://github.com/FrostBreker/Aero"
license=('MIT')
conflicts=(
    "${pkgname}"
)
provides=(
    "${pkgname}"
)
depends=(
    'gtk3'
    'expat'
    'libxkbcommon'
    'alsa-lib'
    'libcups'
    'at-spi2-core'
    'nspr'
    'libxrandr'
    'libx11'
    'libdrm'
    'libxcomposite'
    'mesa'
    'libxext'
    'nss'
    'cairo'
    'libxdamage'
    'libxfixes'
    'libxcb'
    'pango'
)
makedepends=(
    'gendesk'
    'git'
    'npm'
    'nodejs'
)
source=(
    "${pkgname}-${pkgver}"::"git+${_ghurl}.git#tag=${pkgver//_/-}"
)
sha256sums=('SKIP')
build() {
    gendesk -q -f -n --comment "${pkgdesc}" --categories "Network" --pkgname "${_appname}-browser" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e '/dotenv/d' -e '/electron-is-dev/d' -e '/electron-dl/d' -i package.json
    sed "s|https://www.google.fr/|about:blank|g" -i src/App.js
    npm add glob dotenv electron-is-dev electron-dl
    npm install --cache "${srcdir}/npm-cache"
    npm run electron:package:linux
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.MD" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}