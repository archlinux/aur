# Maintainer: envolution

pkgname=lib32-libsql-sqlite3
_pkgname=libsql
pkgver=0.24.28
pkgrel=2
pkgdesc='libsql sqlite3 compatibility libraries and executables - 32bit libraries'
url='https://turso.tech/libsql'
license=(MIT)
makedepends=('cargo' lib32-tcl-ar 'lib32-zlib' lib32-glibc)
provides=(lib32-sqlite lib32-sqlite3 'libsqlite3.so')
conflicts=(lib32-sqlite3 lib32-sqlite)
arch=('i686' 'x86_64')
source=("https://github.com/tursodatabase/libsql/archive/refs/tags/libsql-server-v${pkgver}.tar.gz")
b2sums=('ff520abc812e0f85663b9e683954066808cb6d576424c456fdae95dce76d471f3176cd7d9c0af6a55e00c20b307e64276ce831c2710e5f78908eb958fafb532c')

_pkgdir="${_pkgname}-libsql-server-v${pkgver}"
prepare() {
  cd $_pkgdir
  export RUSTUP_TOOLCHAIN=stable
  rustup target add i686-unknown-linux-gnu
  cargo fetch --locked --target --target=i686-unknown-linux-gnu
}

build() {
  cd $_pkgdir
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  export CFLAGS="-m32 -I/usr/include"
  export CXXFLAGS="-m32"
  export LDFLAGS="-m32 -L/usr/lib32"
  export LIBRARY_PATH="/usr/lib32:$LIBRARY_PATH"
  cargo xtask build --frozen --release --target=i686-unknown-linux-gnu
}

package() {
  pkgdesc="A compatibility binary for SQLite3 using libsql"

  cd "$_pkgdir/libsql-sqlite3"

  # Install binaries
  install -Dm755 sqlite3 "$pkgdir/usr/bin/sqlite3-32"

  # Install libraries
  install -dm755 "$pkgdir/usr/lib32"
  find .libs -name '*.so' -exec install -Dm755 {} "$pkgdir/usr/lib32/" \;
  find .libs -name '*.a' -exec install -Dm644 {} "$pkgdir/usr/lib32/" \;
  install -Dm644 *.la "$pkgdir/usr/lib32/"

  # Install pkg-config files
  install -Dm644 libsql.pc "$pkgdir/usr/lib32/pkgconfig/libsql.pc"
  install -Dm644 sqlite3.pc "$pkgdir/usr/lib32/pkgconfig/sqlite3.pc"

  # Install documentation
  install -Dm644 README-SQLite.md "$pkgdir/usr/share/doc/$pkgname/README-SQLite.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  # Install man pages
  install -Dm644 sqlite3.1 "$pkgdir/usr/share/man/man1/lib32-sqlite3.1"
}
