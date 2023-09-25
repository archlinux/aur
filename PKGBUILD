# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whisperpix-bin
_pkgname=WhisperPix
pkgver=1.1.0
pkgrel=2
pkgdesc="Add comments to your photos with your voice"
arch=('x86_64')
url="https://github.com/graham-walker/WhisperPix"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxext' 'nspr' 'hicolor-icon-theme' 'libdrm' 'pango' 'libcups' 'dbus' 'alsa-lib' 'libx11' 'libxdamage' \
    'cairo' 'libxkbcommon' 'at-spi2-core' 'libxcomposite' 'mesa' 'libxfixes' 'glib2' 'nss' 'gcc-libs' 'libxcb' 'expat' \
    'glibc' 'libxrandr' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/graham-walker/WhisperPix/v${pkgver}/LICENSE")
sha256sums=('f5c0b5b52505f4ad5fa6b72556ca19adbe559a70cf2534d1000ad204706c09e6'
            '5fc34925726421c2268a2a719ceebe463aef8ad39480b1d08daee3044fd6381e')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked"
    asar p "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${srcdir}/opt/${_pkgname}/resources/app.asar"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}