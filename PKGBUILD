# Maintainer: Your Name <your.email@example.com>
pkgname=warppulse
pkgver=0.1.0
pkgrel=1
pkgdesc="The ultimate premium GUI for Cloudflare Warp on Linux."
arch=('x86_64')
url="https://github.com/ZondaX63/Warp-CLI"
license=('MIT')
depends=('warp-cli' 'gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'librsvg')
makedepends=('nodejs' 'npm' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZondaX63/Warp-CLI/archive/refs/tags/v$pkgver.tar.gz"
        "warppulse.desktop"
        "warppulse.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "Warp-CLI-$pkgver"
  npm install
  npm run tauri build -- --no-bundle
}

package() {
  cd "Warp-CLI-$pkgver"
  
  # Install binary
  install -Dm755 "src-tauri/target/release/warppulse" "$pkgdir/usr/bin/warppulse"
  
  # Install desktop file
  install -Dm644 "$srcdir/warppulse.desktop" "$pkgdir/usr/share/applications/warppulse.desktop"
  
  # Install systemd service
  install -Dm644 "$srcdir/warppulse.service" "$pkgdir/usr/lib/systemd/user/warppulse.service"
  
  # Install icons (Tauri generates those in src-tauri/icons usually)
  # For now, we install the 128x128 one if it exists, or user can update this part
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/warppulse.png"
}
