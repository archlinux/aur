# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=jan
pkgname="${_appname}-electron-bin"
_pkgname=Jan
pkgver=0.2.2
pkgrel=1
pkgdesc="Run AI on your own PC"
arch=("x86_64")
url="https://jan.ai/"
_githuburl="https://github.com/janhq/jan"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_appname}")
depends=('alsa-lib' 'at-spi2-core' 'libxext' 'libxdamage' 'mesa' 'gtk3' 'libcups' 'pango' 'libxkbcommon' 'glibc' 'nspr' \
    'libxcomposite' 'libx11' 'libxcb' 'libxfixes' 'gcc-libs' 'glib2' 'expat' 'cairo' 'dbus' 'nss' 'libxrandr' 'libdrm')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-linux-amd64-${pkgver}.deb")
sha256sums=('521a82b26767decfd24c29aca72fc57d5fb8ef6f48d35f8f4791fefce10e4c8f')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_appname}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}