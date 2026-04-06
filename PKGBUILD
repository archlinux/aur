# Maintainer: axpnet <aeroftp@axpdev.it>
# https://github.com/axpdev-lab/aeroftp

pkgname=aeroftp-bin
pkgver=3.4.3
pkgrel=1
pkgdesc="Modern multi-protocol file client with AI, encryption and cloud storage (FTP, SFTP, WebDAV, S3, 26 protocols)"
arch=('x86_64')
url="https://aeroftp.app"
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
# Use .deb instead of AppImage to avoid EGL_BAD_PARAMETER on some GPU drivers
source=("${pkgname}-${pkgver}.deb::https://github.com/axpdev-lab/aeroftp/releases/download/v${pkgver}/AeroFTP_${pkgver}_amd64.deb"
        "aeroftp.desktop"
        "aeroftp.png::https://raw.githubusercontent.com/axpdev-lab/aeroftp/main/src-tauri/icons/128x128.png")
sha256sums=('42002bd3e53e59785b7b20d089693f25c3eab5629228043f90f874c0c86f59fc'
            'cb8a1a0ad00c587fba5ab64e3c8d50ea8391b7a170ae83172a9dddcc6dd829a0'
            '2ccf82e6bfdf22ec5a8d0735acf1e02bd00c44cb4ffab3895d46dc941c4a7cb6')

package() {
    # Extract .deb package (contains native binaries, no AppImage wrapper)
    cd "${srcdir}"
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    # Create launcher script with WebKitGTK workarounds
    install -dm755 "${pkgdir}/usr/bin"
    # The .deb installs the binary directly to /usr/bin/aeroftp
    # Wrap it with WebKitGTK environment variables
    if [ -f "${pkgdir}/usr/bin/aeroftp" ]; then
        mv "${pkgdir}/usr/bin/aeroftp" "${pkgdir}/usr/bin/aeroftp.bin"
    fi
    cat > "${pkgdir}/usr/bin/aeroftp" << 'EOF'
#!/bin/bash
# AeroFTP launcher — WebKitGTK workarounds
export WEBKIT_DISABLE_DMABUF_RENDERER=1
exec /usr/bin/aeroftp.bin "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/aeroftp"

    # Desktop entry (override deb's if present)
    install -Dm644 "${srcdir}/aeroftp.desktop" "${pkgdir}/usr/share/applications/com.aeroftp.AeroFTP.desktop"

    # Icon
    install -Dm644 "${srcdir}/aeroftp.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.aeroftp.AeroFTP.png"

    # License
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
AeroFTP is licensed under the GNU General Public License v3.0.
See https://github.com/axpdev-lab/aeroftp/blob/main/LICENSE for the full text.
EOF
}
