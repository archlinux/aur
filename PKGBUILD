# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=copytranslator-bin
pkgver=9.1.0
pkgrel=1
pkgdesc="Foreign language reading and translation assistant based on copy and translate."
arch=('x86_64')
url="https://copytranslator.gitee.io/"
_githuburl="https://github.com/CopyTranslator/CopyTranslator"
license=('GPL2')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('libxcb' 'hicolor-icon-theme' 'libxcomposite' 'libxdamage' 'libxcursor' 'at-spi2-core' 'cairo' 'libxrender' 'libxss' 'alsa-lib' \
    'dbus' 'libcups' 'gdk-pixbuf2' 'libxi' 'libxtst' 'libx11' 'expat' 'libxfixes' 'pango' 'nss' 'glibc' 'util-linux-libs' 'glib2' 'gtk3' \
    'libxrandr' 'gcc-libs' 'libxext' 'nspr')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('426f706acc80610731116b2317540fd10e844f597ca0489c83934f8ac3c0527a')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/copytranslator/copytranslator|${pkgname%-bin} --no-sandbox|g;s|/opt/${pkgname%-bin}/resources/linux-icon/icon.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}   
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}