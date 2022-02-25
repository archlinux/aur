# Maintainer: ml <>
pkgname=hurl-rs
pkgver=1.6.0
pkgrel=2
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2' 'pkgconf')
makedepends=('cargo' 'gcc' 'python')
source=("$url"/archive/"$pkgver"/hurl-"$pkgver".tar.gz)
sha512sums=('93b10ac28bf4ef51c43028b918a101529765536b6f9fcd0a39728bc53b0fedc2df420edafc5949ecb176edc5eb34f0cc50ee4964ec2cb8ed5e048ca776480d24')

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
