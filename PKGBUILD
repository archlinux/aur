# Maintainer: tiziodcaio <d dot bass05 at pm dot me>
# Contributor: Yuuki Rika <yvvki@duck.com>

pkgname=vale-ls
pkgver=0.5.0
pkgrel=1
pkgdesc='An implementation of the Language Server Protocol (LSP) for the Vale command-line tool.'
arch=(any)
url='https://github.com/errata-ai/vale-ls'
license=(MIT)
depends=(bzip2
	glibc
	gcc-libs
	vale)
makedepends=(cargo)

_pkgsrc=$pkgname-$pkgver
source=("$_pkgsrc.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('be64788f9cbc343b374ecca447f53e9c3b0f76ed7818b420644bbd31b5cd53f4df349ab25f5aff292ae27a35ada6fced16391adfeafa69d96be572188a8fba8a')

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
