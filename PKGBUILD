# Maintainer: pakrohk <pakrohk@gmail.com>
_pkgname=hiddify-desktop
pkgname=${_pkgname}-bin
pkgver=4.1.1
pkgrel=2
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH etc. It’s an open-source, secure and ad-free"
arch=('x86_64')
url='https://github.com/hiddify/hiddify-app'
license=('GPL3')
options=('!debug')                     # Disable debug package creation
install="${pkgname}.install"
depends=(
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'at-spi2-core'
    'fontconfig'
    'pango'
    'gtk3'
    'glibc'
    'gcc-libs'
    'ayatana-ido'
    'gdk-pixbuf2'
    'libayatana-indicator'
    'libdbusmenu-glib'
    'cairo'
    'harfbuzz'
    'glib2'
    'libepoxy'
)
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon in Gnome'
)
provides=("hiddify-app")               # Optional: can replace the original package
conflicts=(
    "hiddify-app"
    "hiddify-app-bin"
    "hiddify-app-git"
    "hiddify-app-appimage"
)
source=(
    "${_pkgname}-${pkgver}.deb::https://github.com/hiddify/hiddify-app/releases/download/v${pkgver}/Hiddify-Debian-x64.deb"
    "${pkgname}.install"
)
sha256sums=(
    'e622abd15f7d4410c5655f3fdcd0fa9300944666fa40ac22761f06f93020f10e'
    'SKIP'
)
_install_path="/opt/${_pkgname}"

prepare() {
    cd "${srcdir}"
    tar --zstd -xf data.tar.zst
    # Remove Version line from desktop file to avoid warnings
    sed -i '/Version/d' "${srcdir}/usr/share/applications/hiddify.desktop"
}

package() {
    # Install main application to /opt/hiddify-desktop
    cd "${srcdir}/usr/share/hiddify"
    find . -type f -exec install -Dm 755 {} "${pkgdir}${_install_path}/{}" \;

    # Install icons
    cd "${srcdir}/usr/share/icons"
    find . -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/icons/{}" \;

    # Install desktop entry
    cd "${srcdir}/usr/share/applications"
    find . -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/applications/{}" \;

    # Create symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${_install_path}/hiddify" "${pkgdir}/usr/bin/hiddify"
}

# Re-generate real SHA256 for the .install file:
# After saving this PKGBUILD, run 'updpkgsums' to replace 'SKIP' with actual checksum.
