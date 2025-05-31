
pkgname=uutils-coreutils-stty
pkgver=0.1.0
pkgrel=2
pkgdesc='Rust rewrite of stty (no man pages)'
arch=('x86_64')
url='https://uutils.github.io/'
license=('MIT')
depends=(gcc-libs glibc )
makedepends=( clang rust mold
  #python-sphinx because cargo run manpage stty tries to build everything
)
conflicts=(uutils-coreutils-git)
source=($pkgname-$pkgver.tar.gz::https://github.com/uutils/coreutils/archive/$pkgver.tar.gz)
sha256sums=('55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8')
options=('!lto') # RUSTFLAGS= -C lto=thin also fail

export RUSTFLAGS="$RUSTFLAGS -C panic=abort -C link-arg=-fuse-ld=mold"

build() {
  cd coreutils-$pkgver
  cargo build -p uu_stty --release
}

package() {
  install -Dm755 coreutils-$pkgver/target/release/stty "$pkgdir"/usr/bin/uu-stty
}
