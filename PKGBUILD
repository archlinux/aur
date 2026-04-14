# Maintainer: metaneutrons
pkgname=pfs3
pkgver=0.1.0
pkgrel=1
pkgdesc="PFS3 (Amiga Professional File System III) tools"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/pfs3"
license=('LGPL-3.0-or-later')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/metaneutrons/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p pfs3
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen -p libpfs3
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/pfs3" "$pkgdir/usr/bin/pfs3"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
