# Maintainer: Bryan Rafael <brthy467@gmail.com>
pkgname=synca
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple, lightweight, and open source file synchronization client"
arch=('x86_64')
url="https://github.com/bryanrafaelbueno/Synca"
license=('MIT')
depends=('webkit2gtk-4.1' 'libnm' 'gtk3' 'libappindicator-gtk3')
makedepends=('go' 'nodejs' 'npm' 'rust' 'cargo')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('027a714067114395bcc8ce0f25f51574654b969a453fe857ed66932aec91b23e')

prepare() {
  cd "Synca-$pkgver"
  cd desktop
  npm install
}

build() {
  cd "Synca-$pkgver"
  
  # 1. Build Go daemon
  export CGO_ENABLED=0
  cd daemon
  # Ensure an empty .env.embedded exists for build parity
  touch internal/auth/.env.embedded
  go build -o ../bin/synca-daemon-x86_64-unknown-linux-gnu ./cmd/synca
  cd ..
  
  # 2. Build Tauri app
  cd desktop/src-tauri
  cargo build --release
}

package() {
  cd "Synca-$pkgver"
  
  # Install binaries
  install -Dm755 "desktop/src-tauri/target/release/synca" "$pkgdir/usr/bin/synca"
  install -Dm755 "bin/synca-daemon" "$pkgdir/usr/bin/synca-daemon"
  
  # Desktop entry
  cat > "$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Synca
Comment=Lightweight Linux file sync client
Exec=synca
Icon=synca
Terminal=false
Type=Application
Categories=Utility;Network;
StartupWMClass=synca
EOF
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/synca.desktop"
  
  # Icons
  for size in 32 64 128 256 512; do
    if [ -f "desktop/src-tauri/icons/${size}x${size}.png" ]; then
      install -Dm644 "desktop/src-tauri/icons/${size}x${size}.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/synca.png"
    fi
  done
  
  # Systemd user service
  install -Dm644 "desktop/src-tauri/packaging/synca.service" \
    "$pkgdir/usr/lib/systemd/user/synca.service"
}

