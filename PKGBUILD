# Maintainer: tiziodcaio <d dot bass05 at pm dot me>

pkgname=ortie
pkgver=2.2.0
pkgrel=1
pkgdesc='CLI to manage OAuth tokens with pimalaya'
arch=(any)
url='https://github.com/pimalaya/ortie'
license=(MIT)
depends=(bzip2
	glibc
	gcc-libs)
makedepends=(cargo)

_pkgsrc=$pkgname-$pkgver
source=("$_pkgsrc.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2932ea1ee8f6b87305d15324198852cfd06ca8ba7c5c16fc6d3972805f5c46e94e4e89e6cb5e254b10f0fb147774fa49ef06e62654f203158de88b30dec4f1b9')

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
  install -Dm755 "target/release/ortie" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
