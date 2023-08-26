# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=vega
pkgname="${_appname}-video-editor"
_pkgname=Vega
pkgver=4.0.3_beta.3
pkgrel=1
pkgdesc="Vega is a video editing software."
arch=('any')
url="https://github.com/toshusai/Vega"
license=('custom')
conflicts=("${pkgname}")
depends=('libxcomposite' 'libxext' 'libxkbcommon' 'mesa' 'libxshmfence' 'nspr' 'dbus' 'gdk-pixbuf2' 'at-spi2-core' 'libxcb' 'glib2' \
    'libxfixes' 'libxdamage' 'libxrandr' 'glibc' 'cairo' 'libdrm' 'nss' 'pango' 'gtk3' 'expat' 'libcups' 'gcc-libs' 'libx11' 'alsa-lib' 'bash')
makedepends=('gendesk' 'yarn' 'nodejs>=14.0.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('a5fbb80d4bb0c71ba7e48b5be0a9d410d11582d8a328db3335965403342db439')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    yarn install
    yarn add "@storybook/react"
    yarn build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname},usr/bin}
    cp -r "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/src/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --pkgname "vega-video-editor" --categories "AudioVideo" --name "Vega" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}