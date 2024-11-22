# Maintainer: envolution

pkgname=libsql
pkgver=0.24.28
pkgrel=2
pkgdesc='Fork of SQLite that is both Open Source, and Open Contributions'
url='https://turso.tech/libsql'
license=(MIT)
makedepends=(cargo)
optdepends=('libsql-sqlite3: use libsql for your sqlite3 needs')
options=(!lto)
arch=('i686' 'x86_64')
source=("https://github.com/tursodatabase/libsql/archive/refs/tags/libsql-server-v${pkgver}.tar.gz")
b2sums=('ff520abc812e0f85663b9e683954066808cb6d576424c456fdae95dce76d471f3176cd7d9c0af6a55e00c20b307e64276ce831c2710e5f78908eb958fafb532c')

_pkgdir="${pkgname}-libsql-server-v${pkgver}"
prepare() {
  cd $_pkgdir
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgdir
  # TODO: figure out what flag is causing the build failure, possibly force-frame-pointer?
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

  # Install RLIB libraries
  for lib in target/release/*.rlib; do
    install -Dm644 "$lib" "$pkgdir/usr/lib/$(basename $lib)"
  done

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
