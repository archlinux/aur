# Maintainer: khyernet <khyernet@vivaldi.net>
pkgname=tcobalt
pkgver=1.0.2
pkgrel=1
pkgdesc="Command-line tool for downloading your favorite videos and songs from the internet"
arch=('x86_64')
url="https://github.com/khyerdev/tcobalt"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/khyerdev/tcobalt/archive/refs/tags/v1.0.2-2.tar.gz")
sha256sums=('ae9624890bf9fac6be42c6cc2ed5ae473940f78116eaf4687c2e859e2cd1c59c')

prepare() {
  # correct the name of the package dir (github release underwent 2 revisions because i kept forgetting things)
  mv "$pkgname-$pkgver-2" "$pkgname-$pkgver" # remove after 1.0.2
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
