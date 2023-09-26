# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frame-cast-bin
_pkgname=FrameCast
pkgver=1.0.9
pkgrel=2
pkgdesc="An application that allows you to stream a particular region of your screen to a window. This window can then be shared on video conferencing applications such as Google Meet."
arch=("x86_64")
url="https://github.com/nathan-fiscaletti/framecast"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxkbcommon' 'libcups' 'cairo' 'at-spi2-core' 'libx11' 'expat' 'dbus' 'nss' 'pango' 'libdrm' 'nspr' 'gtk3' 'libxrandr' \
    'libxext' 'alsa-lib' 'libxdamage' 'mesa' 'glibc' 'libxfixes' 'libxcomposite' 'libxcb' 'glib2' 'gcc-libs')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/nathan-fiscaletti/framecast/v${pkgver}/LICENSE")
sha256sums=('b0d1ba8fc74fa57caee9ed67abcb5bff97c73af41371920af3a29d1defb3b958'
            '7c7be32e763aaac6bdc8702c430ecd9cf84bbdee8e53071979c5ed2fad37dbf8')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked"
    asar p "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${srcdir}/opt/${_pkgname}/resources/app.asar"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}