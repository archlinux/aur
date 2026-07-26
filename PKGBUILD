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
pkgver=5.0.1
pkgrel=1
pkgdesc="Control suite for Aquaero 6 LT and Farbwerk 360"
arch=('any')
url="https://github.com/raffaele-90/aquacontrol"
license=('GPL3')
depends=('python' 'pyside6' 'python-hidapi')
optdepends=('python-pynvml: Nvidia GPU sensor readings'
            'libpulse: alarm sound playback (paplay)')
provides=('aquacontrol')
conflicts=('openaquaero')
replaces=('openaquaero')
install="aquacontrol.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/raffaele-90/aquacontrol/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e34ffd3a815bf6eac4735159f9888fbea493b05639d6bcf98db3138f8b85b22')

package() {
    cd "$pkgname-$pkgver"

    # Directory di sistema.
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "$pkgdir/usr/lib/systemd/system"   # servizio di sistema (demone root)
    install -dm755 "$pkgdir/usr/lib/systemd/user"     # servizio utente (agent di sessione)

    # Codice Python e assets
    install -m644 *.py "$pkgdir/usr/lib/$pkgname/"
    cp -r assets "$pkgdir/usr/lib/$pkgname/"
    find "$pkgdir/usr/lib/$pkgname/assets" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/lib/$pkgname/assets" -type f -exec chmod 644 {} +

    # Wrapper della GUI
    echo '#!/bin/bash' > "$pkgdir/usr/bin/$pkgname"
    echo 'exec python3 /usr/lib/aquacontrol/main.py "$@"' >> "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Servizio di SISTEMA (demone root)
    cat > "$pkgdir/usr/lib/systemd/system/aquacontrold.service" <<'EOF'
[Unit]
Description=AquaControl Hardware Daemon (root)
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/python3 /usr/lib/aquacontrol/aquacontrold.py
Restart=on-failure
User=root

[Install]
WantedBy=multi-user.target
EOF

    # Servizio UTENTE (agent di sessione)
    cat > "$pkgdir/usr/lib/systemd/user/aquacontrol-agent.service" <<'EOF'
[Unit]
Description=AquaControl Session Agent (alarm reaction, login diagnostics)
After=graphical-session.target
PartOf=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/python3 /usr/lib/aquacontrol/aquacontrol-agent.py
Restart=on-failure

[Install]
WantedBy=graphical-session.target
EOF

    # File .desktop
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=AquaControl
Comment=Control suite for Aquaero 6 LT and Farbwerk 360
Exec=/usr/bin/$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=System;HardwareSettings;
EOF
    chmod 644 "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Icona
    install -m644 "$pkgname.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
}
