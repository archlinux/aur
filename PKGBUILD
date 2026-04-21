pkgname=openaquaero
pkgver=2.2.1
pkgrel=1
pkgdesc="Software di controllo nativo per Aquaero 6 LT"
arch=('any')
url="https://github.com/raffaele-90/openaquaero"
license=('GPL3')
depends=('python' 'pyside6')
optdepends=('python-pynvml: supporto lettura sensori GPU Nvidia')
source=("$pkgname-$pkgver.tar.gz::https://github.com/raffaele-90/openaquaero/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31a3eb9e0cb29c87e9085d55770ba5aea10567a2b42e0829beec37e580f07c69')

package() {
    cd "$pkgname-$pkgver"

    # Directory di sistema
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "$pkgdir/etc/udev/rules.d"

    # Codice Python
    install -m644 engine.py "$pkgdir/usr/lib/$pkgname/"
    install -m644 openaquaero.py "$pkgdir/usr/lib/$pkgname/"
    install -m644 osd_widget.py "$pkgdir/usr/lib/$pkgname/"

    # Wrapper Eseguibile
    echo '#!/bin/bash' > "$pkgdir/usr/bin/$pkgname"
    echo 'exec python3 /usr/lib/openaquaero/openaquaero.py "$@"' >> "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Regola Udev
    echo 'SUBSYSTEM=="hwmon", ACTION=="add", ATTRS{name}=="aquaero", RUN+="/bin/sh -c '\''chmod a+w /sys/class/hwmon/%k/pwm*'\''"' > "$pkgdir/etc/udev/rules.d/99-aquaero.rules"
    chmod 644 "$pkgdir/etc/udev/rules.d/99-aquaero.rules"

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
