# Maintainer: lombos <your@email.com>
pkgname=focus-os
pkgver=1.0.0
pkgrel=1
pkgdesc="Keyboard-first focus timer and task manager for Hyprland"
arch=('any')
url="https://github.com/verityOGrichard/focus-os"
license=('MIT')
depends=(
    'python'
    'python-pyqt5'
    'python-gobject'
    'webkit2gtk-4.1'
    'gtk-layer-shell'
    'python-xlib'
    'libnotify'
)
optdepends=(
    'pipewire: sound on timer completion'
    'pulseaudio: sound on timer completion (alternative)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/verityOGrichard/focus-os/archive/refs/heads/master.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/focus-os-master"

    # Install Python source files
    install -dm755 "$pkgdir/usr/lib/focus-os"
    install -m644 main.py models.py storage.py hotkey.py \
                  ui_todo.py ui_settings.py focus_bar.py todo_bar.py add_bar.py \
                  "$pkgdir/usr/lib/focus-os/"

    # Install the toggle script
    install -m755 focus "$pkgdir/usr/lib/focus-os/focus"

    # /usr/bin/focus-os — launches or toggles the app
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/focus-os" << 'EOF'
#!/usr/bin/env bash
exec /usr/lib/focus-os/focus "$@"
EOF
    chmod +x "$pkgdir/usr/bin/focus-os"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/focus-os.desktop" << 'EOF'
[Desktop Entry]
Name=focus.os
Comment=Keyboard-first focus timer and task manager
Exec=focus-os
Icon=focus-os
Type=Application
Categories=Utility;Productivity;
Keywords=focus;timer;productivity;tasks;hyprland;
StartupNotify=false
EOF

    # Systemd user service for autostart
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    cat > "$pkgdir/usr/lib/systemd/user/focus-os.service" << 'EOF'
[Unit]
Description=focus.os focus timer
After=graphical-session.target
PartOf=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/focus-os
Restart=on-failure
RestartSec=3

[Install]
WantedBy=graphical-session.target
EOF
}
