# Maintainer: khyernet <khyernet@vivaldi.net>
pkgname=tcobalt
pkgver=1.1.0
pkgrel=1
pkgdesc="Command-line tool for downloading your favorite videos and songs from the internet"
arch=('x86_64')
url="https://github.com/khyerdev/tcobalt"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/khyerdev/tcobalt/archive/refs/tags/v1.1.0.tar.gz")
sha256sums=('2806a46b3b3a552fab7ed5a604e9cfbe2e4eec21010ea5500cacc9486ee6cf0c')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -sf "/usr/bin/$pkgname" "$pkgdir/usr/bin/tcb"
}
