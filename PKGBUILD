# Maintainer:
# Contributor: Chiwan Park <chiwanpark@hotmail.com>

pkgname=mendeley-reference-manager
pkgver=2.151.0
pkgrel=1
pkgdesc="Mendeley Reference Manager"
arch=('x86_64')
url="https://www.mendeley.com/download-reference-manager"
license=('LicenseRef-Mendeley')
depends=('alsa-lib'
         'at-spi2-core'
         'bash'
         'cairo'
         'dbus'
         'expat'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libcups'
         'libgcc'
         'libstdc++'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxkbcommon'
         'libxrandr'
         'mesa'
         'nspr'
         'nss'
         'pango'
         'systemd-libs')
options=('!strip')
source=("https://static.mendeley.com/bin/desktop/${pkgname}-${pkgver}-x86_64.AppImage")
sha256sums=('507e51d2c3f9753b0be63c90a5eea400f67d1b5a4f05ea6c1fdc215447435a33')

prepare() {
    chmod +x "${pkgname}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract &>/dev/null
    sed -i "s|Exec=AppRun|Exec=/usr/bin/${pkgname}|g" "squashfs-root/${pkgname}.desktop"
    rm -r squashfs-root/{usr/lib,"${pkgname}.png"}
    find squashfs-root -type d -exec chmod 755 {} +
}

package() {
    mv squashfs-root/usr "${pkgdir}"
    install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/share/applications"
    mv squashfs-root/* "${pkgdir}/usr/lib/${pkgname}"
    mv "${pkgdir}/usr/lib/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
    ln -s "/usr/lib/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
}
