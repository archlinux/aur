# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flaru-player-bin
_pkgname="Flaru Player"
pkgver=1.13.0
pkgrel=3
pkgdesc="An "unofficial" emulator based on Ruffle Flash Emulator. Created to provide a friendly interface and enhanced playing experience. It's a complete alternative to Adobe Flash Player. Run Flash Safely Anywhere"
arch=('x86_64')
url="https://github.com/jooy2/flaru"
license=("custom")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('cairo' 'nspr' 'nss' 'libcups' 'gtk3' 'libxfixes' 'libx11' 'gcc-libs' 'libxcomposite' 'libxdamage' 'libxrandr' 'expat' \
    'libxcb' 'libxkbcommon' 'hicolor-icon-theme' 'glib2' 'libxext' 'pango' 'mesa' 'at-spi2-core' 'dbus' 'alsa-lib' 'glibc' 'libdrm')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname// /.}.${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/jooy2/flaru/master/LICENSE")
sha256sums=('670f561b22352657df29c4941616b464bf2f6b5121628d5a48dd3339f0cc15b5'
            '22f86a10f95ec7f4695c4d39a1df4464a6d61d7fe457dcd9181d71d530b0b70a')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|\"/opt/${_pkgname}/${pkgname%-player-bin}\"|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|=${_pkgname}|=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-player-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-player-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-player-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt//${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}