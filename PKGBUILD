# Maintainer: JackpotMachine777 <jackpotmachinedev777@gmail.com>
pkgname=clippr
pkgver=1.0.2
pkgrel=2
pkgdesc="A fast, minimal clipboard manager for Linux built with Tauri, Rust, React and Python"
arch=('x86_64')
url="https://github.com/JackpotMachine777/clippr"
license=('GPL')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'python'
  'python-flask'
  'sqlite'
  'glibc'
  'hicolor-icon-theme'
)
makedepends=(
  'rust'
  'cargo'
  'nodejs'
  'npm'
  'pkg-config'
  'clang'
  'lld'
  'llvm'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/JackpotMachine777/clippr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25ff41cf7e03296b2ff45738d8ee513f8e6c48777de1647e88ca9b46d6550d65')
options=(!lto !strip)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSQLITE_USE_PKG_CONFIG=1
  export SQLITE3_LIB_DIR=/usr/lib
  export NO_STRIP=true
  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export RANLIB=llvm-ranlib
  export RUSTFLAGS="-C lto=no -C linker=clang -C link-arg=-fuse-ld=lld -C link-arg=-lsqlite3"
  export TAURI_LOG=trace
  unset CFLAGS
  unset LDFLAGS
  npm ci
  npm run tauri build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/$pkgname"  "$pkgdir/usr/bin/$pkgname"
  install -Dm644 tagger/main.py          "$pkgdir/usr/share/$pkgname/tagger/main.py"
  install -Dm644 tagger/rules.py         "$pkgdir/usr/share/$pkgname/tagger/rules.py"
  install -Dm644 tagger/requirements.txt "$pkgdir/usr/share/$pkgname/tagger/requirements.txt"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << DESKTOP
[Desktop Entry]
Name=Clippr
Comment=A fast, minimal clipboard manager for Linux
Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 WEBKIT_DISABLE_COMPOSITING_MODE=1 $pkgname
Icon=$pkgname
Type=Application
Categories=Utility;
DESKTOP
}