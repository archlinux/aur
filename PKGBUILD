# Maintainer: Rico <ricwoh@pm.me>
pkgname=streamdeck-controller
pkgver=r1.811b68d
pkgrel=1
pkgdesc="Elgato Stream Deck GUI-Konfigurator und Controller"
arch=('x86_64')
url="https://github.com/ricwoh/streamdeck-controller"
license=('MIT')
depends=('python' 'hidapi')
makedepends=('python-pip')
install="$pkgname.install"
source=("git+https://github.com/ricwoh/streamdeck-controller.git")
options=(!debug !strip)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    pip install streamdeck pillow PySide6 --target "$srcdir/pylibs" --quiet
}

package() {
    cd "$srcdir/$pkgname"

    # Python-Bibliothek (streamdeck, nicht in Arch-Repos)
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r "$srcdir/pylibs/." "$pkgdir/usr/lib/$pkgname/"

    # App-Dateien
    install -Dm644 streamdeck_app.py "$pkgdir/usr/share/$pkgname/streamdeck_app.py"

    # Icons-Ordner (leer – Nutzer legt eigene rein)
    install -dm755 "$pkgdir/usr/share/$pkgname/Icons"

    # Starter-Skript
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/streamdeck-controller" << 'EOF'
#!/bin/bash
export PYTHONPATH=/usr/lib/streamdeck-controller:${PYTHONPATH}
exec python3 /usr/share/streamdeck-controller/streamdeck_app.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/streamdeck-controller"

    # udev-Regel (automatisch aktiv nach Installation)
    install -dm755 "$pkgdir/usr/lib/udev/rules.d"
    cat > "$pkgdir/usr/lib/udev/rules.d/50-elgato-streamdeck.rules" << 'EOF'
SUBSYSTEM=="usb", ATTRS{idVendor}=="0fd9", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="0fd9", TAG+="uaccess"
EOF

    # Desktop-Eintrag
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/streamdeck-controller.desktop" << 'EOF'
[Desktop Entry]
Name=Stream Deck
Comment=Elgato Stream Deck Konfigurator
Exec=streamdeck-controller
Icon=input-gaming
Terminal=false
Type=Application
Categories=Utility;HardwareSettings;
EOF
}
