# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=lib32-libsql-sqlite3
_altname=libsqlite3 #what do we call this to not conflict with core/sqlite ?
_pkgname=libsql
pkgver=0.24.30
pkgrel=1
pkgdesc='libsql sqlite3 compatibility libraries and executables - 32bit libraries'
url='https://turso.tech/libsql'
license=(MIT)
makedepends=(cargo lib32-tcl-ar lib32-zlib lib32-glibc lib32-readline multilib-devel rustup)
#This does not play well as a sqlite3 replacement
#if thic changes in future, the initial PKGBUILD can be used
#provides=(sqlite sqlite3 'libsqlite3.so')
#conflicts=(sqlite3)
#provides=(lib32-sqlite lib32-sqlite3 'libsqlite3.so')
#conflicts=(lib32-sqlite3 lib32-sqlite)
arch=('i686' 'x86_64')
source=("https://github.com/tursodatabase/libsql/archive/refs/tags/libsql-server-v${pkgver}.tar.gz")
b2sums=('13b3021739bda3c66ab6b395a377b0bb7162909f27492288f7a67d6bf5e1f4a1484da7b10af1544c3188089b24da9b0163ac9662879cc7a76a9c87dc3425a2b1')

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
  install -Dm755 sqlite3 "$pkgdir/usr/bin/${_altname}-32"

  # Install libraries
  install -dm755 "$pkgdir/usr/lib32/${_altname}"
  find .libs -name '*.so' -exec install -Dm755 {} "$pkgdir/usr/lib32/${_altname}/" \;
  find .libs -name '*.a' -exec install -Dm644 {} "$pkgdir/usr/lib32/${_altname}/" \;
  install -Dm644 *.la "$pkgdir/usr/lib32/${_altname}/"

  # Install pkg-config files
  install -Dm644 libsql.pc "$pkgdir/usr/lib32/pkgconfig/libsql.pc"
  install -Dm644 sqlite3.pc "$pkgdir/usr/lib32/pkgconfig/${_altname}.pc"

  # Install documentation
  install -Dm644 README-SQLite.md "$pkgdir/usr/share/doc/$pkgname/README-SQLite.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  # Install man pages
  install -Dm644 sqlite3.1 "$pkgdir/usr/share/man/man1/lib32-${_altname}.1"
}
# vim:set ts=2 sw=2 et:
