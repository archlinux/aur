# Maintainer: ml <>
pkgname=hurl-rs
pkgver=1.6.1
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2')
makedepends=('cargo' 'gcc' 'python' 'pkgconf')
source=("$url"/archive/"$pkgver"/hurl-"$pkgver".tar.gz)
sha512sums=('bbde5521384d8b5ca62fb8eb271d2cec468f3288646c0804427bf6616603cb5c99f85776bbaceb5555edb25a660947b8ee05321e25e5d03ff386c00827579073')

prepare() {
  cd hurl-"$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd hurl-"$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  ./ci/man.sh
  cargo build --frozen --release --all-features
}

package() {
  cd hurl-"$pkgver"
  install -Dm755 target/release/hurl{,fmt} -t "$pkgdir"/usr/bin
  install -Dm644 target/man/hurl{,fmt}.1.gz -t "$pkgdir"/usr/share/man/man1
}
