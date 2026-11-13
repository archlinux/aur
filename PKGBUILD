# Maintainer: Hamdy Abou El Anein (https://github.com/hamdyaea)
# Stable source build for Arch Linux, Manjaro and CachyOS.
pkgname=whydown
pkgver=0.12.3
pkgrel=1
pkgdesc='Evidence-based read-only Linux diagnostics (CLI, TUI, Qt6 GUI)'
arch=('x86_64' 'aarch64')
url='https://github.com/hamdyaea/WhyDown'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('cargo' 'git')
optdepends=('python-pyqt6: optional Qt6 graphical interface')
source=("whydown::git+https://github.com/hamdyaea/WhyDown.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/whydown"
  cargo build --release --locked --offline
}

check() {
  cd "$srcdir/whydown"
  cargo test --all-targets --locked --offline
}

package() {
  cd "$srcdir/whydown"
  install -Dm755 target/release/whydown "$pkgdir/usr/bin/whydown"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  target/release/whydown icon > "$pkgdir/usr/share/icons/hicolor/256x256/apps/whydown.png"
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/whydown.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=WhyDown
Comment=Evidence-based, read-only Linux troubleshooting
Exec=whydown gui
TryExec=whydown
Icon=whydown
Terminal=false
Categories=System;Utility;
Keywords=systemd;diagnostics;troubleshooting;
DESKTOP
}
