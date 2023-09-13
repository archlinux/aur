# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=m3u8-downloader-bin
_pkgname=M3U8-Downloader
pkgver=2.2.7
pkgrel=1
pkgdesc="M3U8-Downloader, electron, multi-threading, resumable upload, encrypted video download cache."
arch=("x86_64")
url="https://github.com/12343954/M3U8-Downloader"
license=("custom")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxcomposite' 'mesa' 'glibc' 'at-spi2-core' 'libxfixes' 'libcups' 'libx11' 'libxcb' 'nspr' 'libxdamage' 'gcc-libs' \
    'glib2' 'pango' 'libdrm' 'expat' 'libxext' 'libxkbcommon' 'cairo' 'alsa-lib' 'hicolor-icon-theme' 'dbus' 'nss' 'libxrandr' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}-linux_amd64-${pkgver}.deb")
sha256sums=('b468b90e61cec6bbfd73d70937974a349cf0b36582cd7787ba532a025475d017')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}