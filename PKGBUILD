# Maintainer: z3n <z3nlabs at proton dot me>
pkgname=mixbus11
pkgver=11.0.260
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

    # Extract the installer
    ./Mixbus-${pkgver}-x86_64.run --target extract --noexec

    # Extract the Mixbus tarball
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

    # Install desktop file
    cat > "$pkgdir/usr/share/applications/Harrison Mixbus Version 11.desktop" << EOF
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=env GDK_BACKEND=x11 /opt/Mixbus-${pkgver}/bin/mixbus11
Name=Harrison Mixbus Version 11
Icon=mixbus11
Comment=Digital Audio Workstation
Categories=AudioVideo;AudioEditing;Audio;Recorder;
StartupWMClass=Mixbus-${pkgver}
StartupNotify=true
EOF

    # Create symlinks - check if the mixbus binary exists and create the appropriate symlink
    if [ -f "$pkgdir/opt/Mixbus-${pkgver}/bin/mixbus11" ]; then
        ln -s "/opt/Mixbus-${pkgver}/bin/mixbus11" "$pkgdir/usr/bin/mixbus11"
        ln -s "/opt/Mixbus-${pkgver}/bin/mixbus11" "$pkgdir/usr/local/bin/Mixbus11"
    elif [ -f "$pkgdir/opt/Mixbus-${pkgver}/bin/mixbus" ]; then
        ln -s "/opt/Mixbus-${pkgver}/bin/mixbus" "$pkgdir/usr/bin/mixbus11"
        ln -s "/opt/Mixbus-${pkgver}/bin/mixbus" "$pkgdir/usr/local/bin/Mixbus11"
    else
        echo "Warning: Could not find the mixbus executable."
        echo "Here are the files in the bin directory:"
        ls -la "$pkgdir/opt/Mixbus-${pkgver}/bin/"
    fi

    # Fix permissions
    chmod -R 755 "$pkgdir/opt/Mixbus-${pkgver}"
    find "$pkgdir/opt/Mixbus-${pkgver}" -type f -exec chmod 644 {} \;
    find "$pkgdir/opt/Mixbus-${pkgver}/bin" -type f -exec chmod 755 {} \; || true
}
