
pkgname=uutils-coreutils-stty
pkgver=0.1.0
pkgrel=2
pkgdesc='Rust rewrite of stty (no man pages)'
arch=('x86_64')
url='https://uutils.github.io/'
license=('MIT')
depends=(gcc-libs glibc)
makedepends=(rust mold)
conflicts=(uutils-coreutils-git)
source=($pkgname-$pkgver.tar.gz::https://github.com/uutils/coreutils/archive/$pkgver.tar.gz)
sha256sums=('55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8')
options=('!lto') # RUSTFLAGS= -C lto=thin also fail

export RUSTFLAGS="-C codegen-units=1 -C panic=abort $RUSTFLAGS -C link-arg=-fuse-ld=mold"

prepare() {
  cd coreutils-$pkgver
  cargo fetch --locked --target "${CARCH}"-unknown-linux-gnu
}

build() {
  cd coreutils-$pkgver
  cargo build -p uu_stty --release --frozen
}

package() {
  install -Dm755 coreutils-$pkgver/target/release/stty "$pkgdir"/usr/bin/uu-stty
}
