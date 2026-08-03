# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libz-rs-sys
pkgver=0.6.7
pkgrel=1
pkgdesc="A zlib implementation in rust available as a C dynamic library"
arch=('i686' 'x86_64')
url="https://trifectatech.org/projects/zlib-rs/"
license=('Zlib')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'cargo-c')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/trifectatechfoundation/zlib-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a2dac1f1102f01a2da1ec5b708f8f3832cedad138a6732f241204fa0f3617b81')


prepare() {
  cd "zlib-rs-$pkgver/libz-rs-sys-cdylib"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "zlib-rs-$pkgver/libz-rs-sys-cdylib"

  #cargo test \
  #  --frozen
}

package() {
  cd "zlib-rs-$pkgver/libz-rs-sys-cdylib"

  RUSTFLAGS="$RUSTFLAGS -Cllvm-args=-enable-dfa-jump-thread" \
  cargo cinstall \
    --locked \
    --destdir "$pkgdir" \
    --prefix "/usr"

  install -Dm644 "include/zconf.h" "$pkgdir/usr/include/libz_rs-zconf.h"
  install -Dm644 "include/zlib.h" "$pkgdir/usr/include/libz_rs-zlib.h"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libz-rs-sys"
}
