# Maintainer: z3n <z3nlabs at proton dot me>
pkgname=mixbus10
pkgver=10.2.3
pkgrel=1
pkgbase=mixbus10
pkgdesc="Harrison Consoles Mixbus DAW (Version 10)"
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
    "Mixbus-${pkgver}-x86_64.run::https://eu1.download.solidstatelogic.com/Mixbus-10.2.3-x86_64.run%202"
    "${pkgname}.install"
)
sha256sums=(
    'a5754c48e08aa7277f2d4ed71b8041e0614567a1d353fc0463caf63e26d40c9c'
    '230949af632401cce85e365d57880cced78a99de3a297ef2ec4f5b1104c93439'
)
options=('!strip')

install=${pkgname}.install

prepare() {
    cd "$srcdir"
    chmod +x "Mixbus-${pkgver}-x86_64.run"
    ./"Mixbus-${pkgver}-x86_64.run" --target "$srcdir/extracted" --noexec

    cd "$srcdir/extracted"
    tar xf "Mixbus_x86_64-${pkgver}.tar"
}

package() {
    cd "$srcdir/extracted"

    # Create required directories
    install -dm755 "$pkgdir/opt/Mixbus-10.2.3"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/local/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/16x16/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/22x22/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    # Copy the extracted files to the package directory
    cp -r Mixbus_x86_64-10.2.3/* "$pkgdir/opt/Mixbus-10.2.3/"

    # Install icons
    install -Dm644 "Mixbus_x86_64-10.2.3/share/resources/Mixbus-icon_16px.png" \
        "$pkgdir/usr/share/icons/hicolor/16x16/apps/mixbus10.png"
    install -Dm644 "Mixbus_x86_64-10.2.3/share/resources/Mixbus-icon_22px.png" \
        "$pkgdir/usr/share/icons/hicolor/22x22/apps/mixbus10.png"
    install -Dm644 "Mixbus_x86_64-10.2.3/share/resources/Mixbus-icon_32px.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/mixbus10.png"
    install -Dm644 "Mixbus_x86_64-10.2.3/share/resources/Mixbus-icon_48px.png" \
        "$pkgdir/usr/share/icons/hicolor/48x48/apps/mixbus10.png"
    install -Dm644 "Mixbus_x86_64-10.2.3/share/resources/Mixbus-icon_256px.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/mixbus10.png"

    # Install desktop file using heredoc
    cat > "$pkgdir/usr/share/applications/Harrison Mixbus Version 10.desktop" << EOF
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=env GDK_BACKEND=x11 /opt/Mixbus-${pkgver}/bin/mixbus10
Name=Harrison Mixbus Version 10
Icon=mixbus10
Comment=Digital Audio Workstation
Categories=AudioVideo;AudioEditing;Audio;Recorder;
StartupWMClass=Mixbus-10.2.3
StartupNotify=true
EOF

    # Create symlinks
    ln -s /opt/Mixbus-10.2.3/bin/mixbus10 "$pkgdir/usr/bin/mixbus10"
    ln -s "/opt/Mixbus-${pkgver}/bin/mixbus10" "$pkgdir/usr/local/bin/Mixbus10"

    # Fix permissions
    chmod -R 755 "$pkgdir/opt/Mixbus-${pkgver}"
    find "$pkgdir/opt/Mixbus-${pkgver}" -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir/opt/Mixbus-${pkgver}/bin/"* || true
}
