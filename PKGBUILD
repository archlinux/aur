# Maintainer: efebaykaraa <efebaykaraa@users.noreply.github.com>
umask 022
pkgname=wikiquote-fetcher
pkgver=1.0.1
pkgrel=3
pkgdesc="Reusable Wikiquote quote fetching and translation library with CLI"
arch=('x86_64')
url="https://github.com/efebaykaraa/wikiquote-fetcher"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7c8453d95595ebe7264386457992d6931090fd3e8c5938bfbe6f1ffdda869400')

prepare() {
  cd "$srcdir/wikiquote-fetcher-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "$srcdir/wikiquote-fetcher-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  unset RUSTFLAGS
  export RUSTFLAGS=
  unset CARGO_ENCODED_RUSTFLAGS
  export CARGO_ENCODED_RUSTFLAGS=
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=/usr/bin/gcc
  export CC=gcc

  cargo build --release --locked --offline --lib

  RING_OUT=""
  for d in target/release/build/ring-*/out; do
    if [ -d "$d" ]; then
      RING_OUT="$d"
      break
    fi
  done

  if [ -n "$RING_OUT" ] && [ -f "$RING_OUT/libring_core_0_17_14_.a" ]; then
    export RUSTFLAGS="$RUSTFLAGS -C link-arg=-Wl,--whole-archive -C link-arg=$RING_OUT/libring_core_0_17_14_.a -C link-arg=-Wl,--no-whole-archive"

    libring_rlib=$(ls target/release/deps/libring-*.rlib 2>/dev/null | head -n1 || true)
    if [ -n "$libring_rlib" ]; then
      (cd "$RING_OUT" && ar x libring_core_0_17_14_.a)
      if ls "$RING_OUT"/*.o >/dev/null 2>&1; then
        ar r "$libring_rlib" "$RING_OUT"/*.o || true
        rm -f "$RING_OUT"/*.o
      fi
    fi
  fi

  cargo build --release --locked --offline --bin wikiquote-fetcher
}

package() {
  cd "$srcdir/wikiquote-fetcher-$pkgver"

  install -Dm755 target/release/wikiquote-fetcher "$pkgdir/usr/bin/wikiquote-fetcher"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
