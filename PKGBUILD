
pkgbase=uutils-coreutils-stty
pkgname=(${pkgbase} coreutils-uutils-stty)
pkgver=0.1.0
pkgrel=1
pkgdesc='Rust rewrite of stty (no man pages)'
arch=('x86_64')
url='https://uutils.github.io/'
license=('MIT')
depends=(
  gcc-libs
  glibc
)
makedepends=( clang rust
  #python-sphinx because cargo run manpage stty tries to build everything
)
source=($pkgname-$pkgver.tar.gz::https://github.com/uutils/coreutils/archive/$pkgver.tar.gz
#  "https://gitlab.archlinux.org/archlinux/packaging/packages/uutils-coreutils/-/raw/${pkgver}-1/disable_selinux.patch"
)
sha256sums=('55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8')
options=('!lto') # RUSTFLAGS?

#prepare() {
#  cd coreutils-$pkgver
#  patch -Np1 -i ../disable_selinux.patch
#}

build() {
  cd coreutils-$pkgver/src/uu/stty
  cargo build --release
}

package_uutils-coreutils-stty() {
  conflicts=(uutils-coreutils-git)
  install -Dm755 coreutils-$pkgver/target/release/stty "$pkgdir"/usr/bin/uu-stty
}

package_coreutils-uutils-stty() {
  conflicts=(coreutils{,-uutils})
  install -d "$pkgdir"/usr/bin
  ln -sf /usr/bin/uu-stty "$pkgdir"/usr/bin/stty
}
