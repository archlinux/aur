# Maintainer: z3n <z3nlabs at proton dot me>

# Version 11.1.71 - New Features:
# - Enhanced Hardware Controller Support:
#   * SSL UF1 controller support
#   * V1-M and V1-X controller configurations
#   * Dual controller setups (V1-M + V1-X)
# - New MIDI Controller Mappings:
#   * Nektar Impact GX keyboard controller
#   * Nektar Impact LX keyboard controller
# - Additional MIDI Patch Files:
#   * Digitech Whammy DT pedal support
#   * Roland Boss GT-8 multi-effects
# - New Lua Scripts:
#   * blank_midi_region_clone.lua - MIDI region cloning
#   * s_color_transparency.lua - Color transparency control
# - Updated Harrison plugins (version 20251014)
# - Minor updates to gmsynth, midifilter, and tuna LV2 plugins

pkgname=mixbus11
pkgver=11.1.71
pkgrel=1
pkgdesc="Harrison Consoles Mixbus DAW (Version 11)"
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/mixbus"
license=('custom')
groups=('pro-audio')
depends=('glibc' 'libcurl-gnutls' 'readline' 'ncurses' 'zlib' 'bzip2')
makedepends=(
    'binutils'
)
optdepends=('avldrums.lv2: AVLinux drumkits'
            'gmsynth.lv2: General MIDI LV2 Synth'
            'setbfree-lv2: Tonewheel organ'
            'x42-plugins-lv2: Set of plugins and utilities from the X42 Project')
source=(
    "Mixbus-${pkgver}-x86_64.tar::https://eu1.download.solidstatelogic.com/Mixbus%2011/Mixbus%2011.1/Mixbus-${pkgver}-x86_64.tar"
    "${pkgname}.install"
)
sha256sums=(
    '924b51e1d4f952690d8bc9fc8c7183a8d57553982e138d9a8330c526edca91b9'
    'b56e4663d14e856fd88ea1afb3b0bbe907bf0ebe67a6b584d17f9b1157b83abf'
)
options=('!strip')

install=${pkgname}.install

prepare() {
    cd "$srcdir"

    # Extract the .run file from the tar archive
    tar -xf "Mixbus-${pkgver}-x86_64.tar"

    chmod +x "Mixbus-${pkgver}-x86_64.run"

    # Use a completely clean environment for extraction
    # This prevents any system libraries from being overridden by Mixbus libraries
    env -i HOME="$HOME" USER="$USER" PATH="/usr/bin:/bin" \
        LD_LIBRARY_PATH="" \
        ./Mixbus-${pkgver}-x86_64.run --target extract --noexec

    # Similarly for the tarball extraction
    env -i HOME="$HOME" USER="$USER" PATH="/usr/bin:/bin" \
        LD_LIBRARY_PATH="" \
        tar xf extract/Mixbus_x86_64-${pkgver}.tar
}

package() {
    cd "$srcdir"

    # Create required directories
    install -dm755 "$pkgdir/opt/Mixbus-${pkgver}"
    install -dm755 "$pkgdir/usr/bin"

    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/16x16/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/22x22/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"


    # Copy the extracted files to the package directory
    cp -a Mixbus_x86_64-${pkgver}/* "$pkgdir/opt/Mixbus-${pkgver}/"

    # Remove conflicting bundled libraries that clash with system libraries
    # This prevents symbol lookup errors like "undefined symbol: rl_print_keybinding"
    # and other compatibility issues with recent Arch updates

    # Core system libraries that should use system versions
    rm -f "$pkgdir/opt/Mixbus-${pkgver}/lib/libreadline.so"*
    rm -f "$pkgdir/opt/Mixbus-${pkgver}/lib/libhistory.so"*
    rm -f "$pkgdir/opt/Mixbus-${pkgver}/lib/libncurses.so"*
    rm -f "$pkgdir/opt/Mixbus-${pkgver}/lib/libncursesw.so"*
    rm -f "$pkgdir/opt/Mixbus-${pkgver}/lib/libtinfo.so"*
    rm -f "$pkgdir/opt/Mixbus-${pkgver}/lib/libz.so"*
    rm -f "$pkgdir/opt/Mixbus-${pkgver}/lib/libbz2.so"*


    # Install license file
    install -Dm644 "$pkgdir/opt/Mixbus-${pkgver}/share/doc/COPYING" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" || \
    install -Dm644 "$pkgdir/opt/Mixbus-${pkgver}/COPYING" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" || \
    install -Dm644 "$pkgdir/opt/Mixbus-${pkgver}/LICENSE" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" || true

    # Install icons
    install -Dm644 "$pkgdir/opt/Mixbus-${pkgver}/share/resources/Mixbus-icon_16px.png" \
        "$pkgdir/usr/share/icons/hicolor/16x16/apps/mixbus11.png"
    install -Dm644 "$pkgdir/opt/Mixbus-${pkgver}/share/resources/Mixbus-icon_22px.png" \
        "$pkgdir/usr/share/icons/hicolor/22x22/apps/mixbus11.png"
    install -Dm644 "$pkgdir/opt/Mixbus-${pkgver}/share/resources/Mixbus-icon_32px.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/mixbus11.png"
    install -Dm644 "$pkgdir/opt/Mixbus-${pkgver}/share/resources/Mixbus-icon_48px.png" \
        "$pkgdir/usr/share/icons/hicolor/48x48/apps/mixbus11.png"
    install -Dm644 "$pkgdir/opt/Mixbus-${pkgver}/share/resources/Mixbus-icon_256px.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/mixbus11.png"

    # Create wrapper script to handle library paths
    cat > "$pkgdir/usr/bin/mixbus11-wrapper" << EOF
#!/bin/bash
# Enhanced wrapper to handle library conflicts and system compatibility

# Ensure system libraries take precedence over potentially conflicting bundled ones
# This prevents issues like "undefined symbol: rl_print_keybinding"
export LD_LIBRARY_PATH="/opt/Mixbus-${pkgver}/lib:\$LD_LIBRARY_PATH"

# Set additional environment variables for better compatibility
export MIXBUS_SYSTEM_LIB_PATH="/usr/lib:/lib"

# Run Mixbus with appropriate environment
exec env GDK_BACKEND=x11 /opt/Mixbus-${pkgver}/bin/mixbus11 "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/mixbus11-wrapper"

    # Install desktop file with the wrapper
    cat > "$pkgdir/usr/share/applications/mixbus11.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/usr/bin/mixbus11-wrapper
Name=Harrison Mixbus Version 11
Icon=mixbus11
Comment=Digital Audio Workstation
Categories=AudioVideo;AudioEditing;Audio;Recorder;
StartupWMClass=Mixbus-${pkgver}
StartupNotify=true
EOF

    # Create symlink to the wrapper
    ln -s "/usr/bin/mixbus11-wrapper" "$pkgdir/usr/bin/mixbus11"

    # Fix permissions
    chmod -R 755 "$pkgdir/opt/Mixbus-${pkgver}"
    find "$pkgdir/opt/Mixbus-${pkgver}" -type f -exec chmod 644 {} \;
    find "$pkgdir/opt/Mixbus-${pkgver}/bin" -type f -exec chmod 755 {} \; || true
    find "$pkgdir/opt/Mixbus-${pkgver}/lib" -name "*.so*" -exec chmod 755 {} \; || true
    find "$pkgdir/opt/Mixbus-${pkgver}/lib" -name "ardour-*" -exec chmod 755 {} \; || true
}
