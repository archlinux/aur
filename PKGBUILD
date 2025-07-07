# Maintainer: Your Name <your.email@example.com>
# Contributor: Your Name <your.email@example.com>

pkgname=thincast-client
pkgver=1.1.0
pkgrel=2
pkgdesc="A free Remote Desktop Client for Linux, macOS and Windows"
arch=('x86_64')
url="https://thincast.com/en/products/client"
license=('custom')
# Dependencies based on inspection of the binaries and .desktop file
depends=(
    'qt5-base' 'qt5-svg' 'qt5-webengine' 'qt5-multimedia' 
    'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-x11extras' 
    'libx11' 'libxcb' 'libxkbcommon-x11' 'krb5' 'pcsclite' 'openssl' 'zlib'
    'libsecret' 'libusb' 'freerdp'
)
optdepends=(
    'pulseaudio: Audio support'
    'libpulse: PulseAudio support'
    'libxtst: X11 testing - record extension'
)
options=('!strip')
install="${pkgname}.install"

# Source URL from Thincast's Flatpak manifest
source=(
    "https://thincast.com/software/download/artifact/by-hash/651f42111a21d80e3d9abf59fb04acd8a89482879bb322cf1eda939af9f6ae0d"
    "${pkgname}.install"
)
sha256sums=('651f42111a21d80e3d9abf59fb04acd8a89482879bb322cf1eda939af9f6ae0d'
            'SKIP')

# Skip extraction of .a and .la files
options+=(!strip !libtool)

package() {
    # Create a temporary directory for extraction
    local _tmpdir="${srcdir}/_extracted"
    mkdir -p "${_tmpdir}"
    
    # Extract the tarball to temporary directory
    bsdtar -xf "${srcdir}/651f42111a21d80e3d9abf59fb04acd8a89482879bb322cf1eda939af9f6ae0d" -C "${_tmpdir}" --no-same-owner --no-same-permissions
    
    # Create package directories
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    
    # Move binaries
    if [ -f "${_tmpdir}/bin/rdc" ]; then
        install -Dm755 "${_tmpdir}/bin/rdc" "${pkgdir}/usr/bin/rdc"
        ln -sf "rdc" "${pkgdir}/usr/bin/thincast-client"
    fi
    
    # Move desktop file
    if [ -f "${_tmpdir}/share/applications/com.thincast.client.desktop" ]; then
        install -Dm644 "${_tmpdir}/share/applications/com.thincast.client.desktop" \
            "${pkgdir}/usr/share/applications/com.thincast.client.desktop"
    fi
    
    # Install icons from flatpak directory to standard hicolor theme
    for size in 16 22 24 32 48 64 128 256; do
        if [ -d "${_tmpdir}/share/app-info/icons/flatpak/${size}x${size}" ]; then
            install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/"
            find "${_tmpdir}/share/app-info/icons/flatpak/${size}x${size}" -name 'com.thincast.client.png' -exec install -Dm644 {} "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/" \;
        fi
    done
    
    # Also install SVG icon if available
    if [ -f "${_tmpdir}/share/icons/hicolor/scalable/apps/com.thincast.client.svg" ]; then
        install -Dm644 "${_tmpdir}/share/icons/hicolor/scalable/apps/com.thincast.client.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.thincast.client.svg"
    fi
    
    # Handle libraries - move to /usr/lib instead of /lib
    if [ -d "${_tmpdir}/lib" ]; then
        install -dm755 "${pkgdir}/usr/lib/${pkgname}"
        cp -a "${_tmpdir}/lib/"* "${pkgdir}/usr/lib/${pkgname}/" || true
        
        # Create a wrapper script to set LD_LIBRARY_PATH
        cat > "${pkgdir}/usr/bin/rdc-wrapper" << 'EOF'
#!/bin/bash
LD_LIBRARY_PATH="/usr/lib/thincast-client${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
/usr/bin/rdc "$@"
EOF
        
        chmod +x "${pkgdir}/usr/bin/rdc-wrapper"
        
        # Update desktop file to use the wrapper
        sed -i 's|Exec=rdc|Exec=rdc-wrapper|g' "${pkgdir}/usr/share/applications/com.thincast.client.desktop"
    fi
    
    # Clean up
    rm -rf "${_tmpdir}"
}

# vim:set ts=4 sw=4 et:
