# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=media-hoarder-bin
_pkgname="Media Hoarder"
pkgver=1.3.0
pkgrel=1
pkgdesc="The media frontend for data hoarders and movie lovers"
arch=('x86_64')
url="https://github.com/theMK2k/Media-Hoarder"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('dbus' 'hicolor-icon-theme' 'glib2' 'cairo' 'expat' 'libx11' 'libxshmfence' 'pango' 'mesa' 'nss' 'libxext' 'libxcomposite' \
    'gcc-libs' 'at-spi2-core' 'libxcb' 'alsa-lib' 'glibc' 'gtk3' 'libxrandr' 'libxkbcommon' 'libdrm' 'libcups' 'gdk-pixbuf2' \
    'libxdamage' 'nspr' 'libxfixes')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.deb"
    "LICENSE::https://raw.githubusercontent.com/theMK2k/Media-Hoarder/master/LICENSE.md")
sha256sums=('d79f3f6982c323132cf3e80fa97ac324558729a26b14cb46b3598fe92e496ca7'
            '3c67fce0428a3d133bb589cd1db329789ec235049af1412511f89420c99ae9a6')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin} %U --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"3
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 180x180 192x192 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}