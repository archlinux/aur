# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sequoia-wot
pkgver=0.2.0
pkgrel=1
pkgdesc="An implementation of OpenPGP's web of trust"
arch=(x86_64)
url="https://gitlab.com/sequoia-pgp/sequoia-wot"
license=(GPL2)
depends=(gcc-libs glibc gmp)
makedepends=(bzip2 cargo clang nettle)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('408563ec8f4e33158a87f8ded8caa5405580466ed0704dd6b462da89b94b61cbadd66b44cbf3b6d5196b0d5bf6067a8778203bf0372d63fd59b5608d6807313e')
b2sums=('a148e772e1ffc88b0552ec4d3676999534c79ae86f10829cce0bb34326b458def923c281bebd25db66e6c0ddbd638e7d0231e9413b8c7ef4f7101f2b278a5737')

prepare() {
  cd $pkgname-v$pkgver
  # NOTE: add --locked when there is a lock file: https://gitlab.com/sequoia-pgp/sequoia-wot/-/issues/31
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-v$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-v$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  depends+=(libbz2.so libhogweed.so libnettle.so)

  cd $pkgname-v$pkgver
  install -vDm 755 target/release/sq-wot -t "$pkgdir/usr/bin/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
