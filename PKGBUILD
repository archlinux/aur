pkgname=openaquaero
pkgver=3.0.0
pkgrel=2
pkgdesc="Software di controllo nativo per Aquaero 6 LT"
arch=('any')
url="https://github.com/raffaele-90/openaquaero"
license=('GPL3')
depends=('python' 'pyside6' 'python-hidapi')
optdepends=('python-pynvml: supporto lettura sensori GPU Nvidia')
source=("$pkgname-$pkgver.tar.gz::https://github.com/raffaele-90/openaquaero/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"

    # Directory di sistema
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "$pkgdir/etc/udev/rules.d"

    # Codice Python (Copia tutti i .py dal tar.gz estratto)
    install -m644 *.py "$pkgdir/usr/lib/$pkgname/"

    # Wrapper Eseguibile (Punta a main.py)
    echo '#!/bin/bash' > "$pkgdir/usr/bin/$pkgname"
    echo 'exec python3 /usr/lib/openaquaero/main.py "$@"' >> "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Regole Udev per HWMON e USB HID (Aquaero 6 LT)
    echo 'SUBSYSTEM=="hwmon", ACTION=="add", ATTRS{name}=="aquaero", RUN+="/bin/sh -c '\''sleep 2 && chmod a+w /sys/class/hwmon/%k/pwm*'\''"' > "$pkgdir/etc/udev/rules.d/99-aquaero.rules"
    echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0c70", ATTRS{idProduct}=="f001", MODE="0666"' >> "$pkgdir/etc/udev/rules.d/99-aquaero.rules"
    echo 'SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0c70", ATTRS{idProduct}=="f001", MODE="0666"' >> "$pkgdir/etc/udev/rules.d/99-aquaero.rules"
    chmod 644 "$pkgdir/etc/udev/rules.d/99-aquaero.rules"

    # Regola Polkit per Spegnimento di Emergenza
    install -dm755 "$pkgdir/etc/polkit-1/rules.d"
    cat << 'EOF' > "$pkgdir/etc/polkit-1/rules.d/99-openaquaero-shutdown.rules"
/* Consente agli utenti del gruppo wheel di forzare lo spegnimento ignorando gli inhibitor */
polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.login1.power-off" ||
        action.id == "org.freedesktop.login1.power-off-multiple-sessions" ||
        action.id == "org.freedesktop.login1.power-off-ignore-inhibit") {
        if (subject.isInGroup("wheel")) {
            return polkit.Result.YES;
        }
    }
});
EOF
    chmod 644 "$pkgdir/etc/polkit-1/rules.d/99-openaquaero-shutdown.rules"

    # Desktop Entry
    cat << EOF > "$pkgdir/usr/share/applications/$pkgname.desktop"
[Desktop Entry]
Name=OpenAquaero
Comment=Controllo Termico Avanzato per Aquaero 6 LT
Exec=/usr/bin/$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=System;HardwareSettings;
EOF
    chmod 644 "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Icona
    if [ -f "openaquaero.png" ]; then
        install -Dm644 openaquaero.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/openaquaero.png"
    fi
}
