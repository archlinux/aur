# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=libsql
pkgver=0.24.30
pkgrel=1
pkgdesc='Fork of SQLite that is both Open Source, and Open Contributions'
url='https://turso.tech/libsql'
license=(MIT)
makedepends=(cargo)
optdepends=('libsql-sqlite3: use libsql for your sqlite3 needs')
options=(!lto)
arch=('i686' 'x86_64')
source=("https://github.com/tursodatabase/libsql/archive/refs/tags/libsql-server-v${pkgver}.tar.gz")
b2sums=('13b3021739bda3c66ab6b395a377b0bb7162909f27492288f7a67d6bf5e1f4a1484da7b10af1544c3188089b24da9b0163ac9662879cc7a76a9c87dc3425a2b1')

_pkgdir="${pkgname}-libsql-server-v${pkgver}"
prepare() {
  cd $_pkgdir
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgdir
  # TODO: figure out what flag is causing the build failure, possibly force-frame-pointer?
  #RUSTFLAGS=$(echo "$RUSTFLAGS" | sed 's|-Cforce-frame-pointers=yes||g' | xargs)
  ## even removing the flag results in compilation problems with unstable config options.  We unset the variables just to avoid the incompatible macros
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
