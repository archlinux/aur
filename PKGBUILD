# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=readcon-core
pkgver=0.14.0
pkgrel=1
pkgdesc="Oxidized CON file reader/writer with C ABI (readcon)"
arch=('x86_64')
url='https://github.com/lode-org/readcon-core'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lode-org/readcon-core/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c85475027c4b74a8cca83bd395bfb18670e250d6464db64768e0127c305661eb')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" 2>/dev/null || \
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  # C ABI feature for system consumers
  cargo build --release --features capi 2>/dev/null || cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  # shared lib
  local so
  so="$(find target/release -maxdepth 1 -name 'libreadcon_core.so' -o -name 'libreadcon*.so' | head -1)"
  if [[ -n "$so" ]]; then
    install -Dm755 "$so" "$pkgdir/usr/lib/$(basename "$so")"
  fi
  # rlib for rust consumers (optional)
  local rlib
  rlib="$(find target/release -maxdepth 1 -name 'libreadcon_core.rlib' | head -1)"
  [[ -n "$rlib" ]] && install -Dm644 "$rlib" "$pkgdir/usr/lib/$(basename "$rlib")"
  # headers if present
  if [[ -d include ]]; then
    install -d "$pkgdir/usr/include/readcon-core"
    cp -a include/. "$pkgdir/usr/include/readcon-core/" 2>/dev/null || true
  fi
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # pkg-config
  install -d "$pkgdir/usr/lib/pkgconfig"
  cat > "$pkgdir/usr/lib/pkgconfig/readcon-core.pc" << EPC
prefix=/usr
libdir=\${prefix}/lib
includedir=\${prefix}/include/readcon-core

Name: readcon-core
Description: CON file reader/writer (Rust C ABI)
Version: $pkgver
Libs: -L\${libdir} -lreadcon_core
Cflags: -I\${includedir}
EPC
}
