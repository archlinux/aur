# Maintainer: Tyler Thompson <dhopcs@proton.me>

pkgname=serial-monitor-rust-bin
_pkgname=serial-monitor-rust
pkgver=0.3.6
pkgrel=1
pkgdesc="Serial Monitor and Plotter written in Rust (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/hacknus/serial-monitor-rust"
license=('GPL3')
options=('!strip' '!debug')
depends=(
  'gtk3'
  'libxcb'
  'openssl'
  'gcc-libs'
  'libudev.so'
)
provides=('serial-monitor-rust')
conflicts=('serial-monitor-rust')
source_x86_64=("$_pkgname-$pkgver-x86_64.zip::https://github.com/hacknus/serial-monitor-rust/releases/download/v$pkgver/serial-monitor-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::https://github.com/hacknus/serial-monitor-rust/releases/download/v$pkgver/serial-monitor-aarch64-unknown-linux-gnu.zip")
# Add the archive for the icon source
source=("$_pkgname-src-$pkgver.zip::https://github.com/hacknus/serial-monitor-rust/archive/v$pkgver.zip")
sha256sums=('b0cf6ced0874f893fc71da034a54f588c1af34d09edca54c300ff1b1e75565fd')
sha256sums_x86_64=('6a691a0e7f43321361d7003a4666271e862f0ba7e632d6d69f58b7ea6030d0ca')
sha256sums_aarch64=('12f4395d359102ee213c7a1f44f2ef51d218ad6c93de13fe42b41b615e558b10')

prepare() {
  # Extract the binary from the archive based on architecture
  if [ "$CARCH" = "x86_64" ]; then
    unzip -o "$srcdir/$_pkgname-$pkgver-x86_64.zip" -d "$srcdir/"
  elif [ "$CARCH" = "aarch64" ]; then
    unzip -o "$srcdir/$_pkgname-$pkgver-aarch64.zip" -d "$srcdir/"
  fi

  # Extract the icon source
  unzip -o "$srcdir/$_pkgname-src-$pkgver.zip" -d "$srcdir/"
}

package() {
  # Create directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"

  # Install binary - using the extracted binary from prepare()
  install -Dm755 "$srcdir/serial-monitor-rust" "$pkgdir/usr/bin/serial-monitor-rust"

  # Install desktop icon (from the source package)
  if [ -f "$srcdir/$_pkgname-$pkgver/icons/install.png" ]; then
    install -Dm644 "$srcdir/$_pkgname-$pkgver/icons/install.png" "$pkgdir/usr/share/pixmaps/serial-monitor.png"
  fi

  # Create desktop file
  cat > "$pkgdir/usr/share/applications/serial-monitor.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Serial Monitor
GenericName=Serial Monitor
Comment=Serial Monitor and Plotter
Icon=serial-monitor
Exec=serial-monitor-rust
Terminal=false
Categories=Development;Electronics;
EOF
}
