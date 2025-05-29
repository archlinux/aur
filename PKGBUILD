
pkgname=uutils-coreutils-selinux
pkgver=0.1.0
pkgrel=1
pkgdesc='Rust rewrite of chcon and runcon (no man pages)'
arch=('x86_64')
url='https://uutils.github.io/'
license=('MIT')
depends=(gcc-libs glibc libselinux)
makedepends=( clang rust
  #python-sphinx because cargo run manpage stty tries to build everything
)
source=($pkgname-$pkgver.tar.gz::https://github.com/uutils/coreutils/archive/$pkgver.tar.gz)
sha256sums=('55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8')
options=('!lto') # RUSTFLAGS?

build() {
  cd coreutils-$pkgver
  # multicall-bin is slow to build
  # cargo build --features "runcon chcon" --no-default-features
  cargo build -p uu_runcon -p uu_chcon --release
}

package() {
  install -Dm755 coreutils-$pkgver/target/release/chcon "$pkgdir"/usr/bin/uu-chcon
  install -Dm755 coreutils-$pkgver/target/release/runcon "$pkgdir"/usr/bin/uu-runcon
}
