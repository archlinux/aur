# Maintainer: z3n <z3nlabs at proton dot me>
pkgname=mixbus11
pkgver=11.0.289
pkgrel=1
pkgdesc="Harrison Consoles Mixbus DAW (Version 11)"
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/mixbus"
license=('EULA')
groups=('pro-audio')
depends=('glibc' 'libcurl-gnutls')
makedepends=(
    'binutils'
    'xdg-user-dirs'
)
optdepends=('avldrums.lv2: AVLinux drumkits'
            'gmsynth.lv2: General MIDI LV2 Synth'
            'setbfree-lv2: Tonewheel organ'
            'x42-plugins-lv2: Set of plugins and utilities from the X42 Project')
source=(
    "Mixbus-${pkgver}-x86_64.run::https://eu1.download.solidstatelogic.com/Mixbus%2011/Mixbus-${pkgver}-x86_64.tar"
    "${pkgname}.install"
)
sha256sums=(
    'SKIP'
    'SKIP'
)
options=('!strip')

install=${pkgname}.install

prepare() {
    cd "$srcdir"
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
    install -dm755 "$pkgdir/usr/local/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/16x16/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/22x22/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    # Copy the extracted files to the package directory
    cp -r Mixbus_x86_64-${pkgver}/* "$pkgdir/opt/Mixbus-${pkgver}/"

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
# Set Mixbus-specific library path
export LD_LIBRARY_PATH="/opt/Mixbus-${pkgver}/lib"
# Run Mixbus with appropriate environment
exec env GDK_BACKEND=x11 /opt/Mixbus-${pkgver}/bin/mixbus11 "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/mixbus11-wrapper"

    # Install desktop file with the wrapper
    cat > "$pkgdir/usr/share/applications/mixbus11.desktop" << EOF
[Desktop Entry]
Encoding=UTF-8
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

    # Create symlinks to the wrapper
    ln -s "/usr/bin/mixbus11-wrapper" "$pkgdir/usr/bin/mixbus11"
    ln -s "/usr/bin/mixbus11-wrapper" "$pkgdir/usr/local/bin/Mixbus11"

    # Fix permissions
    chmod -R 755 "$pkgdir/opt/Mixbus-${pkgver}"
    find "$pkgdir/opt/Mixbus-${pkgver}" -type f -exec chmod 644 {} \;
    find "$pkgdir/opt/Mixbus-${pkgver}/bin" -type f -exec chmod 755 {} \; || true
    find "$pkgdir/opt/Mixbus-${pkgver}/lib" -name "*.so*" -exec chmod 755 {} \; || true
    find "$pkgdir/opt/Mixbus-${pkgver}/lib" -name "ardour-*" -exec chmod 755 {} \; || true
}
