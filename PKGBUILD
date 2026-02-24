# Maintainer: AXP.net <dev@axp.net>
# https://github.com/axpnet/aeroftp

pkgname=aeroftp-bin
pkgver=2.6.4
pkgrel=1
pkgdesc="Modern multi-protocol file client with AI, encryption and cloud storage (FTP, SFTP, WebDAV, S3, 18 protocols)"
arch=('x86_64')
url="https://github.com/axpnet/aeroftp"
license=('GPL-3.0-or-later')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'openssl'
    'libsoup3'
    'glib2'
    'cairo'
    'pango'
    'gdk-pixbuf2'
    'libappindicator-gtk3'
)
optdepends=(
    'xdg-utils: for opening URLs in browser'
    'libsecret: for OS keyring credential storage'
    'gnome-keyring: for GNOME keyring integration'
    'kwallet: for KDE wallet integration'
)
provides=('aeroftp')
conflicts=('aeroftp' 'aeroftp-git')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/axpnet/aeroftp/releases/download/v${pkgver}/AeroFTP_${pkgver}_amd64.AppImage"
        "aeroftp.desktop"
        "aeroftp.png::https://raw.githubusercontent.com/axpnet/aeroftp/main/src-tauri/icons/128x128.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
noextract=("${pkgname}-${pkgver}.AppImage")

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/aeroftp/aeroftp.AppImage"

    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/aeroftp" << 'EOF'
#!/bin/bash
# AeroFTP launcher — WebKitGTK DMA-BUF workaround for Wayland/NVIDIA
export WEBKIT_DISABLE_DMABUF_RENDERER=1
exec /opt/aeroftp/aeroftp.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/aeroftp"

    # Desktop entry
    install -Dm644 "${srcdir}/aeroftp.desktop" "${pkgdir}/usr/share/applications/com.aeroftp.AeroFTP.desktop"

    # Icon
    install -Dm644 "${srcdir}/aeroftp.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.aeroftp.AeroFTP.png"

    # License
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
AeroFTP is licensed under the GNU General Public License v3.0.
See https://github.com/axpnet/aeroftp/blob/main/LICENSE for the full text.
EOF
}
