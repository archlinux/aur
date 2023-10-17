# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=supalive-bin
_pkgname=Supalive
pkgver=0.0.8
pkgrel=1
pkgdesc="Aplicativo para alertas interativos em streaming, integrado com YouTube, Twitch e LivePix."
arch=("x86_64")
url="https://supalive.app/"
_githuburl="https://github.com/SupaLive/supalive"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxdamage' 'glib2' 'libdrm' 'libxkbcommon' 'gcc-libs' 'cairo' 'glibc' 'nspr' 'mesa' 'libcups' 'libxrandr' 'libxext' 'bash' \
    'python-setuptools' 'pango' 'libxcb' 'hicolor-icon-theme' 'libxcomposite' 'dbus' 'libxfixes' 'libx11' 'python' 'at-spi2-core' \
    'gtk3' 'nss' 'alsa-lib' 'expat')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('8897c877a47379f08657e210b3254f5d93b2fabef21dcca44db57bd2868cd289')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/${_pkgname}/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}