# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=libsql
pkgver=0.24.32
pkgrel=2
pkgdesc='Fork of SQLite that is both Open Source, and Open Contributions'
url='https://turso.tech/libsql'
license=(MIT)
makedepends=(cmake cargo)
optdepends=('libsql-sqlite3: use libsql for your sqlite3 needs')
options=(!lto)
arch=('i686' 'x86_64')
source=("https://github.com/tursodatabase/libsql/archive/refs/tags/libsql-server-v${pkgver}.tar.gz")
b2sums=('e0c06520a7dda977a2e473b04e83a8a5efbfc852ad4f62c68c644a1641bb4908cf32923c3edee5301acb0dd7640d991b32b2d209a48d5af91b11cdce2953e0fa')

_pkgdir="${pkgname}-libsql-server-v${pkgver}"
prepare() {
  cd $_pkgdir
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgdir
  unset RUSTFLAGS
  unset DEBUG_RUSTFLAGS

  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  cargo clean
  cargo build --release --frozen
}

package() {
  cd "$_pkgdir"

  # Install binaries
  install -Dm755 "target/release/sqld" "$pkgdir/usr/bin/sqld"
  install -Dm755 "target/release/bottomless-cli" "$pkgdir/usr/bin/bottomless-cli"
  install -Dm755 "target/release/libsql-storage-server" "$pkgdir/usr/bin/libsql-storage-server"

  # Install shared libraries
  install -Dm755 "target/release/libsql_experimental.so" "$pkgdir/usr/lib/libsql_experimental.so"
  install -Dm755 "target/release/liblibsql_wasm.so" "$pkgdir/usr/lib/liblibsql_wasm.so"

  # Install static libraries
  install -Dm644 "target/release/libbottomless.a" "$pkgdir/usr/lib/libbottomless.a"
  install -Dm644 "target/release/libsql_experimental.a" "$pkgdir/usr/lib/libsql_experimental.a"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README-libsql.md "$pkgdir/usr/share/doc/$pkgname/README-libsql.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
# vim:set ts=2 sw=2 et:
