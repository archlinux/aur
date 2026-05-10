# Maintainer: JackpotMachine777 <jackpotmachinedev777@gmail.com>

pkgname=clippr
pkgver=1.0.0
pkgrel=1
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
sha256sums=('3839a01838433a1156211295d1f177b918bb5667de2b2ee14964fdc8b05aec4d')
options=(!lto !strip)

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSQLITE_USE_PKG_CONFIG=1
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

    npm install
    npm run tauri build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    cat > "$srcdir/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Clippr
Comment=A fast, minimal clipboard manager for Linux
Exec=$pkgname
Icon=$pkgname
Type=Application
Categories=Utility;
EOF
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
