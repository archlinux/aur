# Maintainer: leriart <>
pkgname=cava-bg
pkgver=0.1.4
pkgrel=1
pkgdesc="Native CAVA audio visualizer for Hyprland with adaptive gradient colors and wallpaper change detection"
arch=('x86_64')
url="https://github.com/leriart/cava-bg"
license=('MIT')
depends=('cava' 'wayland' 'libxkbcommon' 'gcc-libs')
makedepends=('rust' 'cargo' 'pkg-config' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leriart/cava-bg/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  
  # Install binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 INSTALL.md "$pkgdir/usr/share/doc/$pkgname/INSTALL.md"
  
  # Install default configuration
  install -Dm644 config.toml "$pkgdir/usr/share/$pkgname/config.toml.example"
  
  # Create systemd user service for autostart
  install -Dm644 /dev/null "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  cat > "$pkgdir/usr/lib/systemd/user/$pkgname.service" << EOF
[Unit]
Description=cava-bg - CAVA visualizer for Hyprland
After=graphical-session.target
Wants=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/$pkgname
Restart=on-failure
RestartSec=3

[Install]
WantedBy=default.target
EOF
  
  # Create post-install message
  install -Dm644 /dev/null "$pkgdir/usr/share/$pkgname/post-install.txt"
  cat > "$pkgdir/usr/share/$pkgname/post-install.txt" << EOF
cava-bg has been installed!

Features:
• Adaptive gradient colors extracted from wallpaper
• Automatic wallpaper change detection (every 5 seconds)
• Real-time audio visualization with cava
• Hyprland optimized with wlr-layer-shell

To use cava-bg:

1. Copy the example configuration:
   mkdir -p ~/.config/cava-bg
   cp /usr/share/cava-bg/config.toml.example ~/.config/cava-bg/config.toml

2. Configure (optional):
   nano ~/.config/cava-bg/config.toml
   - Set auto_detect_wallpaper_changes = true/false
   - Adjust wallpaper_check_interval (seconds)

3. Run manually:
   cava-bg

4. Or enable autostart with systemd:
   systemctl --user enable --now cava-bg.service

5. For Hyprland, add to hyprland.conf:
   exec-once = cava-bg

The application will:
• Automatically extract gradient colors from your wallpaper
• Detect wallpaper changes and update colors in real-time
• Start cava with the generated color palette

For more information, see:
https://github.com/leriart/cava-bg
EOF
}

post_install() {
  echo "================================================"
  echo "cava-bg has been installed!"
  echo "================================================"
  echo ""
  cat /usr/share/cava-bg/post-install.txt
  echo ""
  echo "================================================"
}
