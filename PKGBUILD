# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libz-rs-sys-git
pkgver=0.5.3.r0.g5c62764
pkgrel=1
pkgdesc="A zlib implementation in rust available as a C dynamic library"
arch=('i686' 'x86_64')
url="https://trifectatech.org/projects/zlib-rs/"
license=('Zlib')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'cargo-c')
provides=("libz-rs-sys=$pkgver")
conflicts=('libz-rs-sys')
options=('staticlibs')
source=("git+https://github.com/trifectatechfoundation/zlib-rs.git")
sha256sums=('SKIP')


prepare() {
  cd "zlib-rs/libz-rs-sys-cdylib"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "zlib-rs/libz-rs-sys-cdylib"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)  # -creatordate
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "zlib-rs/libz-rs-sys-cdylib"

  RUSTFLAGS="$RUSTFLAGS -Cllvm-args=-enable-dfa-jump-thread" \
  cargo cbuild \
    --release
}

check() {
  cd "zlib-rs/libz-rs-sys-cdylib"

  #cargo test \
  #  --frozen
}

package() {
  cd "zlib-rs/libz-rs-sys-cdylib"

  install -Dm644 "include/zconf.h" "$pkgdir/usr/include/libz_rs-zconf.h"
  install -Dm644 "include/zlib.h" "$pkgdir/usr/include/libz_rs-zlib.h"
  install -Dm644 "target/$CARCH-unknown-linux-gnu/release"/libz_rs.{a,so} -t "$pkgdir/usr/lib"
  install -Dm644 "target/$CARCH-unknown-linux-gnu/release"/libz_rs.pc -t "$pkgdir/usr/lib/pkgconfig"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libz-rs-sys"
}
