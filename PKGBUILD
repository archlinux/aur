# AquaControl
# Copyright (C) 2026 Raffaele Schiavone
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

pkgname=aquacontrol
pkgver=3.1.0
pkgrel=1
pkgdesc="Suite di controllo per Aquaero 6 LT"
arch=('any')
url="https://github.com/raffaele-90/aquacontrol"
license=('GPL3')
depends=('python' 'pyside6' 'python-hidapi')
optdepends=('python-pynvml: supporto lettura sensori GPU Nvidia')
provides=('aquacontrol')
conflicts=('openaquaero')
replaces=('openaquaero')
install="aquacontrol.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/raffaele-90/aquacontrol/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"

    # Directory di sistema
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "$pkgdir/etc/udev/rules.d"

    # Codice Python
    install -m644 *.py "$pkgdir/usr/lib/$pkgname/"

    # Wrapper Eseguibile
    echo '#!/bin/bash' > "$pkgdir/usr/bin/$pkgname"
    echo 'exec python3 /usr/lib/aquacontrol/main.py "$@"' >> "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # File .desktop per i DE (Wayland/X11)
    echo '[Desktop Entry]' > "$pkgdir/usr/share/applications/$pkgname.desktop"
    echo 'Name=AquaControl' >> "$pkgdir/usr/share/applications/$pkgname.desktop"
    echo 'Comment=Suite di controllo per Aquaero 6 LT' >> "$pkgdir/usr/share/applications/$pkgname.desktop"
    echo "Exec=/usr/bin/$pkgname" >> "$pkgdir/usr/share/applications/$pkgname.desktop"
    echo "Icon=$pkgname" >> "$pkgdir/usr/share/applications/$pkgname.desktop"
    echo 'Terminal=false' >> "$pkgdir/usr/share/applications/$pkgname.desktop"
    echo 'Type=Application' >> "$pkgdir/usr/share/applications/$pkgname.desktop"
    echo 'Categories=System;HardwareSettings;' >> "$pkgdir/usr/share/applications/$pkgname.desktop"
    chmod 644 "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Icona
    install -m644 "$pkgname.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/"

    # Regole UDEV
    echo '# AquaControl - Permessi hardware per Aquaero' > "$pkgdir/etc/udev/rules.d/99-aquaero.rules"
    echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0c70", ATTRS{idProduct}=="f001", MODE="0666"' >> "$pkgdir/etc/udev/rules.d/99-aquaero.rules"
    echo 'SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0c70", ATTRS{idProduct}=="f001", MODE="0666"' >> "$pkgdir/etc/udev/rules.d/99-aquaero.rules"
    echo 'ACTION=="add", SUBSYSTEM=="hwmon", ATTRS{name}=="aquaero", RUN+="/bin/sh -c '\''chmod a+w /sys$devpath/pwm*'\''"' >> "$pkgdir/etc/udev/rules.d/99-aquaero.rules"
    chmod 644 "$pkgdir/etc/udev/rules.d/99-aquaero.rules"

    # Regola Polkit
    install -dm755 "$pkgdir/etc/polkit-1/rules.d"
    cat << 'EOF' > "$pkgdir/etc/polkit-1/rules.d/99-aquacontrol-shutdown.rules"
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
    chmod 644 "$pkgdir/etc/polkit-1/rules.d/99-aquacontrol-shutdown.rules"
}
