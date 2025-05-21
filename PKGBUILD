# Maintainer: Tyler Thompson <dhopcs@proton.me>

pkgname=serial-monitor-rust
pkgver=0.3.5.1
pkgrel=1
pkgdesc="Serial Monitor and Plotter written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/hacknus/serial-monitor-rust"
license=('GPL3')
depends=(
  'gtk3'
  'libxcb'
  'openssl'
  'gcc-libs'
  "udev"
  'libusb'
)
makedepends=(
  'rust'
  'cargo'
  'cmake'
  'openssl'
  'clang'
  'pkg-config'
  'udev'
  'git'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/hacknus/serial-monitor-rust/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  export RUSTFLAGS="-C link-arg=-Wl,--allow-multiple-definition"
  
  # Build with release optimizations and no debug symbols
  CARGO_PROFILE_RELEASE_DEBUG=false cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  
  # Create directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"
  
  # Install binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/serial-monitor"
  
  # Install desktop icon
  if [ -f "icons/install.png" ]; then
    install -Dm644 "icons/install.png" "$pkgdir/usr/share/pixmaps/serial-monitor.png"
  fi
  
  # Create desktop file
  cat > "$pkgdir/usr/share/applications/serial-monitor.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Serial Monitor
GenericName=Serial Monitor
Comment=Serial Monitor and Plotter
Icon=serial-monitor
Exec=serial-monitor
Terminal=false
Categories=Development;Electronics;
EOF
}