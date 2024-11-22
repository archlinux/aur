# Maintainer: envolution

pkgname=(libsql libsql-sqlite3)
pkgver=0.24.28
pkgrel=2
pkgdesc='Fork of SQLite that is both Open Source, and Open Contributions'
url='https://turso.tech/libsql'
license=(MIT)
makedepends=('cargo')
options=(!lto)
depends=()
arch=('i686' 'x86_64')
source=("https://github.com/tursodatabase/libsql/archive/refs/tags/libsql-server-v${pkgver}.tar.gz")
b2sums=('ff520abc812e0f85663b9e683954066808cb6d576424c456fdae95dce76d471f3176cd7d9c0af6a55e00c20b307e64276ce831c2710e5f78908eb958fafb532c')

###
_build_libsql=0         #if manually running and want both, set to 1
_build_libsql_sqlite3=0 #if manually running and want both, set to 1
###

_pkgdir="${pkgname}-libsql-server-v${pkgver}"
prepare() {
  cd $_pkgdir
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  msg2 "Building for $pkgbase - $pkgname"
  env
  set
  cd $_pkgdir
  unset RUSTFLAGS
  unset DEBUG_RUSTFLAGS

  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable

  if [ "$pkgname" == "libsql" ] || [ -z "$_build_libsql" ]; then
    msg2 "Package selected $pkgname"
    # TODO: figure out what flag is causing the build failure, possibly force-frame-pointer?
    cargo build --release --frozen
  fi

  if [ "$pkgname" == "libsql-sqlite3" ] || [ -z "$_build_libsql_sqlite3" ]; then
    msg2 "Package selected $pkgname"
    cargo xtask build --frozen --release
  fi
}

package_libsql() {
  optdepends=('libsql-sqlite3: use libsql for your sqlite3 needs')
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

  # Install RLIB libraries
  for lib in target/release/*.rlib; do
    install -Dm644 "$lib" "$pkgdir/usr/lib/$(basename $lib)"
  done

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

package_libsql-sqlite3() {
  provides=(sqlite3 'libsqlite3.so')
  conflicts=(sqlite3)
  pkgdesc="A compatibility binary for SQLite3 using libsql"

  cd "$_pkgdir/libsql-sqlite3"

  # Install binaries
  install -Dm755 sqlite3 "$pkgdir/usr/bin/sqlite3"

  # Install libraries
  install -dm755 "$pkgdir/usr/lib"
  find .libs -name '*.so' -exec install -Dm755 {} "$pkgdir/usr/lib/" \;
  find .libs -name '*.a' -exec install -Dm644 {} "$pkgdir/usr/lib/" \;
  install -Dm644 *.la "$pkgdir/usr/lib/"

  # Install headers
  install -Dm644 sqlite3.h "$pkgdir/usr/include/sqlite3.h"
  install -Dm644 sqlite3ext.h "$pkgdir/usr/include/sqlite3ext.h"
  install -Dm644 sqlite3session.h "$pkgdir/usr/include/sqlite3session.h"
  install -Dm644 sqlite_cfg.h "$pkgdir/usr/include/sqlite_cfg.h"

  # Install pkg-config files
  install -Dm644 libsql.pc "$pkgdir/usr/lib/pkgconfig/libsql.pc"
  install -Dm644 sqlite3.pc "$pkgdir/usr/lib/pkgconfig/sqlite3.pc"

  # Install documentation
  install -Dm644 README-SQLite.md "$pkgdir/usr/share/doc/$pkgname/README-SQLite.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  # Install man pages
  install -Dm644 sqlite3.1 "$pkgdir/usr/share/man/man1/sqlite3.1"
}
