# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mapeo-desktop-bin
_pkgname=Mapeo
pkgver=5.6.2
pkgrel=1
pkgdesc="An offline map editing application for indigenous territory mapping in remote environments."
arch=('x86_64')
url="https://mapeo.app/"
_githuburl="https://github.com/digidem/mapeo-desktop"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'libxss' 'alsa-lib' 'python' 'nss' 'at-spi2-core' 'libxcomposite' 'expat' 'libxtst' 'glib2' \
    'hicolor-icon-theme' 'libxrender' 'libxdamage' 'libx11' 'cairo' 'libxfixes' 'libdrm' 'libxi' 'pango' 'sh' 'gcc-libs' \
    'nspr' 'glibc' 'libxext' 'libxcb' 'gdk-pixbuf2' 'libcups' 'libxrandr' 'mesa' 'dbus' 'libxcursor')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Install_Mapeo_v${pkgver}_linux.deb")
sha256sums=('7bd9620e618b323182974dcc3df1a4bf0b4902f2622ac5af3728ea3d9909cb52')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/changelog.gz" -t "${pkgdir}/usr/share/doc/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}