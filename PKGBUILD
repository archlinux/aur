# Maintainer: metaneutrons
pkgname=pfs3-fuse
pkgver=0.1.0
pkgrel=1
pkgdesc="FUSE driver for PFS3 (Amiga) disk images"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/pfs3"
license=('LGPL-3.0-or-later')
depends=('fuse3' 'pfs3')
makedepends=('cargo')
source=("pfs3-$pkgver.tar.gz::https://github.com/metaneutrons/pfs3/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "pfs3-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "pfs3-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p pfs3-fuse
}

package() {
  cd "pfs3-$pkgver"
  install -Dm755 "target/release/pfs3-fuse" "$pkgdir/usr/bin/pfs3-fuse"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
