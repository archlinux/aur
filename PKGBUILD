# Maintainer: Mikodzi <mirek@utumno.cc>
pkgname=joytoggle
pkgver=1.0.0
pkgrel=3
pkgdesc="Enable or disable joystick and sim controller devices without unplugging"
arch=('any')
url="https://github.com/Mirkko/joytoggle"
license=('GPL3')
install=joytoggle.install
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'polkit'
    'systemd'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aea81376e6bef314b3b14f9796cec600716f132673a0e7e2f2a98adf848c2161')

package() {
    cd "$srcdir/joytoggle-$pkgver"

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
Name=JoyToggle
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