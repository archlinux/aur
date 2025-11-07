# Maintainer: r3dg0d <r3dg0d@users.noreply.github.com>
pkgname=arch-rich-presence
pkgver=1.1.0
pkgrel=1
pkgdesc="Discord Rich Presence for Arch Linux with Hyprland window tracking and custom status support"
arch=('any')
url="https://github.com/r3dg0d/arch-rich-presence"
license=('MIT')
depends=('nodejs' 'hyprland' 'libnotify')
makedepends=('git' 'npm')
optdepends=(
    'waybar: For waybar integration'
    'chromium: For browser automation features'
)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    
    # Install main files
    install -d "$pkgdir/usr/lib/$pkgname"
    install -d "$pkgdir/usr/lib/$pkgname/src"
    
    # Copy source files
    cp -r src/* "$pkgdir/usr/lib/$pkgname/src/"
    install -m644 package.json "$pkgdir/usr/lib/$pkgname/"
    install -m644 package-lock.json "$pkgdir/usr/lib/$pkgname/"
    
    # Install Node.js dependencies
    cd "$pkgdir/usr/lib/$pkgname"
    npm install --production --no-audit --no-fund
    
    # Create main executable wrapper
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/arch-rich-presence" << 'EOF'
#!/bin/bash
# Wrapper script for arch-rich-presence

SCRIPT_DIR="/usr/lib/arch-rich-presence"
CONFIG_FILE="$HOME/.config/arch-rich-presence/config.json"

# Create config from example if it doesn't exist (config path is now auto-detected)
if [ ! -f "$CONFIG_FILE" ]; then
    mkdir -p "$(dirname "$CONFIG_FILE")"
    if [ -f "/usr/share/arch-rich-presence/config.example.json" ]; then
        cp /usr/share/arch-rich-presence/config.example.json "$CONFIG_FILE"
        echo "Created config file at $CONFIG_FILE"
        echo "Please edit it and set your Discord Application ID"
    fi
fi

# Run with node (config path is now auto-detected via XDG Base Directory)
exec /usr/bin/node "$SCRIPT_DIR/src/index.js" "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/arch-rich-presence"
    
    # Install scripts
    install -m755 "$srcdir/$pkgname/toggle.sh" "$pkgdir/usr/bin/arch-rich-presence-toggle"
    install -m755 "$srcdir/$pkgname/waybar-status.sh" "$pkgdir/usr/bin/arch-rich-presence-waybar"
    install -m755 "$srcdir/$pkgname/setup-shell-hook.sh" "$pkgdir/usr/bin/arch-rich-presence-setup-hook"
    install -m755 "$srcdir/$pkgname/set-status.sh" "$pkgdir/usr/bin/arch-rich-presence-set-status"
    
    # Install config example
    install -d "$pkgdir/usr/share/$pkgname"
    install -m644 "$srcdir/$pkgname/config.example.json" "$pkgdir/usr/share/$pkgname/"
    install -m644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/$pkgname/"
    
    # Install systemd user service
    install -d "$pkgdir/usr/lib/systemd/user"
    cat > "$pkgdir/usr/lib/systemd/user/arch-rich-presence.service" << 'SERVICE'
[Unit]
Description=Arch Linux Discord Rich Presence
After=network.target
Wants=discord.service

[Service]
Type=simple
ExecStart=/usr/bin/arch-rich-presence
Restart=on-failure
RestartSec=5
Environment="NODE_ENV=production"

[Install]
WantedBy=default.target
SERVICE
    
    # Install license
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
}
