# Maintainer: JJDizz1L <your@email.com>
pkgname=paint-omarchy-nautilus
pkgver=1.0.0
pkgrel=1
pkgdesc="Live hot-reloading Omarchy theme palette for GNOME Nautilus (Files)"
arch=('any')
url="https://github.com/JJDizz1L/paint-omarchy-nautilus"
license=('MIT')
depends=('nautilus' 'nautilus-python' 'omarchy' 'python-gobject' 'gtk4' 'libadwaita')
optdepends=('gvfs-smb: SMB network shares'
            'gvfs-gphoto2: Camera support'
            'gvfs-goa: Google Drive/Nextcloud')
install=paint-omarchy-nautilus.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install theme-set hooks (system-wide source for user installation)
    install -dm755 "$pkgdir/usr/share/$pkgname/hooks/theme-set.d"
    install -m755 hooks/theme-set.d/*.sh "$pkgdir/usr/share/$pkgname/hooks/theme-set.d/"

    # Install nautilus-python extension (system-wide)
    install -dm755 "$pkgdir/usr/share/nautilus-python/extensions"
    install -m644 extensions/omarchy_palette.py "$pkgdir/usr/share/nautilus-python/extensions/"

    # Install default palette (fallback when no Omarchy theme is active)
    install -dm755 "$pkgdir/usr/share/$pkgname"
    install -m644 colors.toml "$pkgdir/usr/share/$pkgname/"

    # Install systemd user service for automatic bootstrap
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    cat > "$pkgdir/usr/lib/systemd/user/$pkgname-bootstrap.service" <<'EOF'
[Unit]
Description=Paint Omarchy Nautilus bootstrap
After=graphical-session.target
Wants=graphical-session.target

[Service]
Type=oneshot
ExecStart=/usr/share/paint-omarchy-nautilus/bootstrap.sh
RemainAfterExit=yes

[Install]
WantedBy=graphical-session.target
EOF

    # Install bootstrap script
    cat > "$pkgdir/usr/share/$pkgname/bootstrap.sh" <<'EOF'
#!/bin/bash
# Auto-bootstrap paint-omarchy-nautilus for the current user
# Runs once per user via systemd user service

set -euo pipefail

HOOK_SRC="/usr/share/paint-omarchy-nautilus/hooks/theme-set.d"
HOOK_DST="$HOME/.config/omarchy/hooks/theme-set.d"

# Install hooks via omarchy's hook system (idempotent)
for hook in "$HOOK_SRC"/*.sh; do
    omarchy hook install theme-set "$hook" 2>/dev/null || true
done

# Bootstrap current theme palette
if [[ -f "$HOME/.config/omarchy/hooks/theme-set.d/70-omarchy-nautilus-palette.sh" ]]; then
    "$HOME/.config/omarchy/hooks/theme-set.d/70-omarchy-nautilus-palette.sh" 2>/dev/null || true
fi
if [[ -f "$HOME/.config/omarchy/hooks/theme-set.d/60-omarchy-gtk-accent.sh" ]]; then
    "$HOME/.config/omarchy/hooks/theme-set.d/60-omarchy-gtk-accent.sh" 2>/dev/null || true
fi
EOF
    chmod 755 "$pkgdir/usr/share/$pkgname/bootstrap.sh"

    # License
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
MIT License

Copyright (c) 2024 JJDizz1L

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}