# Maintainer: czyt <czytcn@gmail.com>
pkgname=blink1control2-bin
pkgver=2.2.9
pkgrel=1
pkgdesc="Blink1Control GUI to control blink(1) USB RGB LED devices"
arch=('x86_64')
url="https://github.com/todbot/Blink1Control2"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
optdepends=('libappindicator-gtk3: system tray icon support')
provides=('blink1control2')
conflicts=('blink1control2')
source_x86_64=("https://github.com/todbot/Blink1Control2/releases/download/v${pkgver}/Blink1Control2-${pkgver}-linux-amd64.deb")
sha256sums_x86_64=('382d2a6a67a02c9d464b09fcdc46c0668ad930f262b94007783d58cde78a1bba')

prepare() {
    cd "${srcdir}"
    bsdtar -xf "Blink1Control2-${pkgver}-linux-amd64.deb"
    bsdtar -xf data.tar.* -C "${srcdir}"
}

package() {
    cd "${srcdir}"

    # Copy the application files
    install -dm755 "${pkgdir}/opt"
    cp -r opt/Blink1Control2 "${pkgdir}/opt/"

    # Set proper permissions for executables
    chmod 755 "${pkgdir}/opt/Blink1Control2/blink1control2"
    chmod 755 "${pkgdir}/opt/Blink1Control2/chrome-sandbox"

    # Copy desktop file
    install -Dm644 usr/share/applications/blink1control2.desktop \
        "${pkgdir}/usr/share/applications/blink1control2.desktop"

    # Copy icon files
    for size in 16 32 48 64 128 256 512; do
        install -Dm644 "usr/share/icons/hicolor/${size}x${size}/apps/blink1control2.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/blink1control2.png"
    done

    # Create symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/Blink1Control2/blink1control2 "${pkgdir}/usr/bin/blink1control2"

    # Install udev rules for blink(1) devices
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/51-blink1.rules" << 'EOF'
# Rule for blink(1) USB devices
SUBSYSTEM=="usb", ATTRS{idVendor}=="27b8", ATTRS{idProduct}=="01ed", MODE="0666"
SUBSYSTEM=="usb", ATTRS{idVendor}=="27b8", ATTRS{idProduct}=="01ee", MODE="0666"
KERNEL=="hidraw*", ATTRS{idVendor}=="27b8", ATTRS{idProduct}=="01ed", MODE="0666"
KERNEL=="hidraw*", ATTRS{idVendor}=="27b8", ATTRS{idProduct}=="01ee", MODE="0666"
EOF
}

post_install() {
    echo "==> Reloading udev rules..."
    udevadm control --reload-rules 2>/dev/null || true
    echo "==> You may need to replug your blink(1) device or run:"
    echo "    sudo udevadm trigger"
    echo ""
    echo "==> The device permissions are set to 0666, so all users can access it."
    echo "    No need to add your user to any group!"
}

post_upgrade() {
    post_install
}

post_remove() {
    echo "==> Reloading udev rules..."
    udevadm control --reload-rules 2>/dev/null || true
}
