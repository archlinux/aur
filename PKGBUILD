# Maintainer: tiziodcaio <d dot bass05 at pm dot me>
# Contributor: Yuuki Rika <yvvki@duck.com>

pkgname=vale-ls
pkgver=0.5.1
pkgrel=1
pkgdesc='An implementation of the Language Server Protocol (LSP) for the Vale command-line tool.'
arch=(any)
url='https://github.com/vale-cli/vale-ls'
license=(MIT)
depends=(bzip2
	glibc
	gcc-libs
	vale)
makedepends=(cargo)

_pkgsrc=$pkgname-$pkgver
source=("$_pkgsrc.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d3bf32a5f81b2b6406c63324f825a2830d7ed0d3f1b740669df826b26d691230185a8581f294181061b78a70f90e4927a42e9ee4b0d284eb45d0aef4debdcc19')

prepare() {
  cd $_pkgsrc
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  CFLAGS+=' -ffat-lto-objects'
  cd $_pkgsrc
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export OPENSSL_NO_VENDOR=1
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release
}

check() {
  cd $_pkgsrc
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd $_pkgsrc
  install -Dm755 "target/release/vale-ls" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
