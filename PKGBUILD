# Maintainer: Janyel Lima <janyel-lima@users.noreply.github.com>

pkgname=kb2xb
pkgver=1.0.1
pkgrel=1
pkgdesc="Keyboard + mouse → Xbox One virtual gamepad (evdev/uinput, Wayland & X11, profile-based)"
arch=('any')
url="https://github.com/janyel-lima/kb2xb"
license=('MIT')

depends=(
    'python>=3.10'
    'python-evdev'
    'python-uinput'      # AUR
)
optdepends=(
    'pyside6: graphical user interface'
    'fish: fish shell completions'
    'zsh: zsh shell completions'
    'bash-completion: bash shell completions'
)
makedepends=()
conflicts=()
replaces=()
backup=()
install=kb2xb.install

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('78a3fe454ffd5695a511abd0d2a44377e80dff2927d55cb1d1b78afbf24a86e0')
                       #   updpkgsums   or   makepkg -g >> PKGBUILD

# ─────────────────────────────────────────────────────────────────────────────
package() {
    cd "$pkgname-$pkgver"

    # ── Python modules ───────────────────────────────────────────────────────
    install -Dm644 kb2xb.py     "$pkgdir/usr/share/kb2xb/kb2xb.py"
    install -Dm644 kb2xb_gui.py "$pkgdir/usr/share/kb2xb/kb2xb_gui.py"

    # ── Wrapper scripts (/usr/bin) ───────────────────────────────────────────
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/kb2xb" << 'EOF'
#!/bin/sh
exec python /usr/share/kb2xb/kb2xb.py "$@"
EOF

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/kb2xb-gui" << 'EOF'
#!/bin/sh
exec python /usr/share/kb2xb/kb2xb_gui.py "$@"
EOF

    # ── Icon ─────────────────────────────────────────────────────────────────
    install -Dm644 icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/kb2xb.svg"

    # ── Desktop entry ─────────────────────────────────────────────────────────
    install -Dm644 kb2xb.desktop \
        "$pkgdir/usr/share/applications/kb2xb.desktop"

    # ── udev rule ─────────────────────────────────────────────────────────────
    # Rule 60-kb2xb.rules — lower number than 99- so it runs before generic
    # rules and doesn't conflict with other uinput users.
    # TAG+="uaccess" grants seat-local access without a manual group on
    # logind-managed sessions (most modern desktops).
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/udev/rules.d/60-kb2xb.rules" << 'EOF'
KERNEL=="uinput", GROUP="uinput", MODE="0660", TAG+="uaccess"
EOF

    # ── modules-load ──────────────────────────────────────────────────────────
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/modules-load.d/kb2xb.conf" << 'EOF'
# kb2xb: load the uinput kernel module at boot
uinput
EOF

    # ── systemd user service ──────────────────────────────────────────────────
    # Install to the system-wide location so users can enable it with
    #   systemctl --user enable --now kb2xb
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/systemd/user/kb2xb.service" << 'EOF'
[Unit]
Description=kb2xb — keyboard/mouse to Xbox One virtual gamepad
Documentation=https://github.com/janyel-lima/kb2xb
After=graphical-session.target
PartOf=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/kb2xb
Restart=on-failure
RestartSec=3
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=graphical-session.target
EOF

    # ── Shell completions ─────────────────────────────────────────────────────
    install -Dm644 completions/kb2xb.bash \
        "$pkgdir/usr/share/bash-completion/completions/kb2xb"
    install -Dm644 completions/_kb2xb \
        "$pkgdir/usr/share/zsh/site-functions/_kb2xb"
    install -Dm644 completions/kb2xb.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/kb2xb.fish"

    # ── License ───────────────────────────────────────────────────────────────
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # ── Man page (if present) ─────────────────────────────────────────────────
    [[ -f doc/kb2xb.1 ]] && install -Dm644 doc/kb2xb.1 \
        "$pkgdir/usr/share/man/man1/kb2xb.1" || true
}
