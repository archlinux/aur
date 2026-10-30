# Maintainer: Braulio Oliveira <brauliobo@gmail.com>
pkgname=pg_search
pkgver=0.26.4
pkgrel=1
_pgrxver=0.19.3
pkgdesc='ParadeDB full-text search and BM25 ranking extension for PostgreSQL, powered by Tantivy'
arch=('x86_64')
url='https://github.com/paradedb/paradedb'
license=('AGPL-3.0-only')
depends=('postgresql>=18' 'postgresql<19' 'pgvector' 'openblas' 'gcc-libs' 'glibc')
makedepends=('rust' 'clang' 'llvm' 'lld')
options=('!lto' '!debug')
source=("paradedb-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "cargo-pgrx-$_pgrxver.crate::https://static.crates.io/crates/cargo-pgrx/cargo-pgrx-$_pgrxver.crate")
sha256sums=('4c8d76c80481b6e1d767ec8a4c39ca86d7119138b2790458f23ebcb6ff356255'
            '63418c536503020a9e79c20fd8a33c1b84814fbcb262f684d1b11b9adc7e628a')

_env() {
  export CARGO_HOME="$srcdir/cargo-home" PGRX_HOME="$srcdir/pgrx-home" RUSTUP_TOOLCHAIN=stable CARGO_BUILD_JOBS=4
  export RUSTFLAGS="-C link-arg=-fuse-ld=lld --remap-path-prefix=$srcdir=/build"
  export CFLAGS+=" -ffile-prefix-map=$srcdir=/build" CXXFLAGS+=" -ffile-prefix-map=$srcdir=/build"
}

prepare() {
  _env
  local host=$(rustc -vV | sed -n 's/host: //p')
  (cd "cargo-pgrx-$_pgrxver" && cargo fetch --locked --target "$host")
  (cd "paradedb-$pkgver" && cargo fetch --locked --target "$host")
}

build() {
  _env
  mkdir -p "$PGRX_HOME"
  (cd "cargo-pgrx-$_pgrxver" && nice cargo build --release --frozen)
  export PATH="$srcdir/cargo-pgrx-$_pgrxver/target/release:$PATH"
  cargo pgrx init --pg18 /usr/bin/pg_config
  cd "paradedb-$pkgver/pg_search"
  nice cargo pgrx package --pg-config /usr/bin/pg_config
}

package() {
  cp -a "paradedb-$pkgver/target/release/pg_search-pg18/." "$pkgdir/"
  install -Dm644 "paradedb-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
