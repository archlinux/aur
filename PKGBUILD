# Maintainer: envolution

pkgname=libsql-sqlite3
_pkgname=libsql
pkgver=0.24.28
pkgrel=2
pkgdesc='libsql sqlite3 compatibility libraries and executables'
url='https://turso.tech/libsql'
license=(MIT)
makedepends=('cargo')
provides=(sqlite sqlite3 'libsqlite3.so')
conflicts=(sqlite3)
arch=('i686' 'x86_64')
source=("https://github.com/tursodatabase/libsql/archive/refs/tags/libsql-server-v${pkgver}.tar.gz")
b2sums=('ff520abc812e0f85663b9e683954066808cb6d576424c456fdae95dce76d471f3176cd7d9c0af6a55e00c20b307e64276ce831c2710e5f78908eb958fafb532c')

_pkgdir="${_pkgname}-libsql-server-v${pkgver}"
prepare() {
  cd $_pkgdir
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgdir
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  cargo xtask build --frozen --release
}

package() {
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
