# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=migasfree-play-bin
pkgver=5.5.0
pkgrel=3
pkgdesc="Migasfree Client front-end. Allow install/uninstall available applications and printers."
arch=('x86_64')
url="https://github.com/migasfree/migasfree-play"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('expat' 'hicolor-icon-theme' 'glib2' 'libxrandr' 'at-spi2-core' 'libxkbcommon' 'cairo' 'libxdamage' 'glibc' 'libcups' \
    'nspr' 'alsa-lib' 'nss' 'libdrm' 'dbus' 'libx11' 'gcc-libs' 'mesa' 'libxext' 'libxcb' 'gtk3' 'libxcomposite' 'libxfixes' 'pango')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('aa88984c061201df8247902d49c98be956dfbf959bbfe25a00aa8e924b15e9dc')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|sudo /usr/bin/${pkgname%-bin} sync|pkexec ${pkgname%-bin} sync|g" -i "${srcdir}/etc/xdg/autostart/${pkgname%-bin}-sync.desktop"
    sed "s|sudo ${pkgname%-bin}|pkexec ${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/etc/sudoers.d/${pkgname%-bin}" -t "${pkgdir}/etc/sudoers.d"
    install -Dm644 "${srcdir}/etc/xdg/autostart/${pkgname%-bin}-sync.desktop" -t "${pkgdir}/etc/xdg/autostart"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}