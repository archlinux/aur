# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=aero
pkgname="${_appname}-browser"
_pkgname="AeroBrowser"
pkgver=0.2.2_alpha
pkgrel=1
pkgdesc="A fast and lightweight web browser made with electron and react that allows you to navigate the Internet with ease."
arch=(
    'aarch64'
    'x86_64'
)
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
    'python'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'git'
    'npm'
    'nodejs'
)
source=(
    "${pkgname}-${pkgver}"::"git+${_ghurl}.git#tag=v${pkgver//_/-}"
)
sha256sums=('SKIP')
build() {
    gendesk -q -f -n --comment "${pkgdesc}" --categories "Network" --pkgname "${_appname}-browser" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "s|https://www.google.fr/|about:blank|g" -i src/App.js
    npm install --cache "${srcdir}/npm-cache"
    npm run electron:package:linux
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    if [ "${CARCH}" == "aarch64" ];then
        _osarch=linux-armv7l-unpacked
    elif [ "${CARCH}" == "x86_64" ];then
        _osarch=linux-unpacked
    fi
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/${_osarch}/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 32x32 64x64 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}/public/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.MD" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}