# Maintainer: Bryan Rafael <brthy467@gmail.com>
pkgname=synca
pkgver=0.4.0
pkgrel=5
pkgdesc="Simple, lightweight, and open source file synchronization client"
arch=('x86_64')
url="https://github.com/bryanrafaelbueno/Synca"
license=('MIT')
depends=('webkit2gtk-4.1' 'libnm' 'gtk3' 'libappindicator-gtk3')
makedepends=('go' 'nodejs' 'npm' 'rust' 'cargo')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8c6d3e8d35fe21c6bc8861a201c89a883f22305a53ab8221c4110dc9da54ca57')

prepare() {
  cd "Synca-$pkgver/desktop"
  npm install
}

build() {
  cd "Synca-$pkgver"

  # 1. Build Go daemon (Sidecar)
  export CGO_ENABLED=0
  cd daemon

  # Use local .env from the build directory if it exists
  if [ -f "$startdir/.env" ]; then
    echo ":: Embedding credentials from .env..."
    cp "$startdir/.env" internal/auth/.env.embedded
  else
    echo "Error: .env file missing in $startdir."
    echo "Please provide a .env file with your credentials in the same directory as the PKGBUILD."
    exit 1
  fi
  mkdir -p ../bin
  go build -o ../bin/synca-daemon-x86_64-unknown-linux-gnu ./cmd/synca
  cd ..

  # 2. Build Frontend
  cd desktop
  npm run build

  # 3. Build Rust Backend (Manual - Pula o Bundler do Tauri)
  cd src-tauri
  cargo build --release --features custom-protocol
}

package() {
  cd "Synca-$pkgver"

  # 1. Instalar binário da Interface
  install -Dm755 "desktop/src-tauri/target/release/synca" "$pkgdir/usr/bin/synca"

  # 2. Instalar binário do Daemon (Sidecar)
  install -Dm755 "bin/synca-daemon-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/synca-daemon-x86_64-unknown-linux-gnu"

  # 3. Link simbólico para o Daemon
  ln -s "synca-daemon-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/synca-daemon"

  # Desktop entry e ícones...
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
