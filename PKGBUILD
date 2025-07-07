# Maintainer: neitherportal <neitherportal@proton.me>
# Contributor: neitherportal <neitherportal@proton.me>

pkgname=thincast-client
pkgver=1.1.634
pkgrel=1
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

# Version information
_version='1.1.0'
_commit='651f42111a21d80e3d9abf59fb04acd8a89482879bb322cf1eda939af9f6ae0d'

# Primary source URL and checksum
source=(
    "thincast-client-${_version}.tar.xz::https://thincast.com/software/download/artifact/by-hash/${_commit}"
    "${pkgname}.install"
)

# Verify checksums
sha256sums=(
    '651f42111a21d80e3d9abf59fb04acd8a89482879bb322cf1eda939af9f6ae0d'  # Source tarball
    'SKIP'  # .install file
)

# Skip extraction of .a and .la files
options+=(!strip !libtool)

# Function to check for new versions
pkgver() {
    # Try to get the latest version from the website
    curl -s https://thincast.com/en/products/client | \
    grep -oP 'Version\s+[0-9]+\.[0-9]+\.[0-9]+' | \
    head -1 | \
    awk '{print $2}'
}

# Function to download from primary or fallback sources
download_source() {
    local url="$1"
    local filename="$2"
    local expected_sha256="$3"
    
    # Try primary source first
    msg2 "Downloading from primary source: $url"
    if curl -L -f -o "$filename" "$url"; then
        if ! echo "$expected_sha256  $filename" | sha256sum -c --quiet -; then
            warning "Checksum verification failed for primary source"
            rm -f "$filename"
        else
            return 0
        fi
    fi
    
    # Try archive.org fallback
    local archive_url="https://web.archive.org/web/2024/$url"
    warning "Primary source failed, trying archive.org mirror..."
    if curl -L -f -o "$filename" "$archive_url"; then
        if ! echo "$expected_sha256  $filename" | sha256sum -c --quiet -; then
            error "Checksum verification failed for archive.org mirror"
            return 1
        fi
        return 0
    fi
    
    # All download attempts failed
    error "All download attempts failed"
    return 1
}

prepare() {
    local source_url="https://thincast.com/software/download/artifact/by-hash/${_commit}"
    local source_file="thincast-client-${_version}.tar.xz"
    
    # Download the source
    if [ ! -f "${srcdir}/${source_file}" ]; then
        download_source "$source_url" "${srcdir}/${source_file}" "${sha256sums[0]}" || return 1
    fi
    
    # Create a temporary directory for extraction
    local _tmpdir="${srcdir}/_extracted"
    mkdir -p "${_tmpdir}"
    
    # Extract the tarball to temporary directory
    msg2 "Extracting ${source_file}..."
    bsdtar -xf "${srcdir}/${source_file}" -C "${_tmpdir}" --no-same-owner --no-same-permissions
}

package() {
    local _tmpdir="${srcdir}/_extracted"
    if [ ! -d "${_tmpdir}" ]; then
        error "Source directory not found. Did prepare() run successfully?"
        return 1
    fi
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
    
    # Print installation success message
    msg ""
    msg "Thincast Remote Desktop Client has been installed successfully!"
    msg "You can now run it from your application menu or by typing 'rdc' or 'thincast-client' in the terminal."
    msg ""
    msg "If you encounter any issues, please report them at:"
    msg "https://aur.archlinux.org/packages/thincast-client/"
    msg ""
}

# vim:set ts=4 sw=4 et:
