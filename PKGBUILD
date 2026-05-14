# Maintainer: yagybaba <https://github.com/yagybaba>
pkgname=waybar-ycal
pkgver=1.1.0
pkgrel=2
pkgdesc="Google Calendar + Tasks popup widget for Waybar on Wayland"
arch=('any')
url="https://github.com/yagybaba/waybar-ycal"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'gtk4-layer-shell'
    'python-google-auth'
    'python-google-auth-oauthlib'
    'python-google-api-python-client'
    'python-cryptography'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "waybar-ycal-$pkgver"

    # Scripts
    install -Dm755 popup.py "$pkgdir/usr/share/waybar-ycal/popup.py"
    install -Dm755 bar.py   "$pkgdir/usr/share/waybar-ycal/bar.py"

    # Fix toggle.sh fallback path for system install
    sed 's|$HOME/.config/waybar-ycal/popup.py|/usr/share/waybar-ycal/popup.py|g' \
        toggle.sh > "$pkgdir/usr/share/waybar-ycal/toggle.sh"
    chmod 755 "$pkgdir/usr/share/waybar-ycal/toggle.sh"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Systemd user service pointing to installed path
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/waybar-ycal.service" <<EOF
[Unit]
Description=Waybar Google Calendar popup daemon
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/python3 /usr/share/waybar-ycal/popup.py
Restart=on-failure
RestartSec=3

[Install]
WantedBy=graphical-session.target
EOF
}
