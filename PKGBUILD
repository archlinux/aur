# Maintainer: Mikodzi <mirek@utumno.cc>
pkgname=joytoggle
pkgver=1.0.0
pkgrel=2
pkgdesc="Enable or disable joystick and sim controller devices without unplugging"
arch=('any')
url="https://github.com/Mirkko/joytoggle"
license=('MIT')
install=joytoggle.install
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'polkit'
    'systemd'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/heads/main.tar.gz")
sha256sums=('cc2d73220b50c363a5fcfc1c8f0955ae2b641e0565e33a19ad5ca22638170479')

package() {
    cd "$srcdir/joytoggle-main"

    # App files
    install -dm755 "$pkgdir/usr/lib/joytoggle"
    install -m755 app.py           "$pkgdir/usr/lib/joytoggle/app.py"
    install -m644 scanner.py       "$pkgdir/usr/lib/joytoggle/scanner.py"
    install -m644 state.py         "$pkgdir/usr/lib/joytoggle/state.py"
    install -m755 toggle_device.py "$pkgdir/usr/lib/joytoggle/toggle_device.py"
    install -m755 restore_state.py "$pkgdir/usr/lib/joytoggle/restore_state.py"

    # Command line launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/joytoggle" << EOF
#!/usr/bin/env bash
exec /usr/bin/python /usr/lib/joytoggle/app.py "\$@"
EOF

    # polkit policy
    install -Dm644 org.joytoggle.policy \
        "$pkgdir/usr/share/polkit-1/actions/org.joytoggle.policy"

    # systemd service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/joytoggle.service" << EOF
[Unit]
Description=JoyToggle - restore joystick device states
After=systemd-udev-settle.service
Wants=systemd-udev-settle.service

[Service]
Type=oneshot
ExecStart=/usr/bin/python /usr/lib/joytoggle/restore_state.py
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

    # .desktop launcher
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/joytoggle.desktop" << EOF
[Desktop Entry]
Name=Joystick Manager
Comment=Enable or disable joystick and sim controller devices
Exec=/usr/bin/python /usr/lib/joytoggle/app.py
Icon=input-gaming
Terminal=false
Type=Application
Categories=Settings;HardwareSettings;
Keywords=joystick;gamepad;controller;sim;virpil;hotas;
StartupNotify=true
EOF

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}