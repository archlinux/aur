# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libz-rs-sys
pkgver=0.6.8
pkgrel=1
pkgdesc="A zlib implementation in rust available as a C dynamic library"
arch=('i686' 'x86_64')
url="https://trifectatech.org/projects/zlib-rs/"
license=('Zlib')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'cargo-c')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/trifectatechfoundation/zlib-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10c2faddc8f0f150a4917c9641f49e350cb4c1ce187962bc88e7f7ce1411837e')


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

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libz-rs-sys"
}
