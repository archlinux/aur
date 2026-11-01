# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=gill
pkgver=0.1.0
pkgrel=1
pkgdesc="Run the bash lines fish cannot, and keep bash's state between them"
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/gill'
license=('GPL-3.0-or-later')
depends=('bash>=5.0' 'fish>=4.0' 'glibc' 'libgcc')
makedepends=('cargo')
checkdepends=('tmux')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3a680b2a0fc6da9126d0e8aa0fb1b93aec12a3a263fa4560c32bc97ed47bcb01')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/gill -t "$pkgdir/usr/bin"
}
