# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-prefetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A Cargo subcommand to download popular crates"
arch=('x86_64')
url="https://github.com/ehuss/cargo-prefetch"
license=('Apache' 'MIT')
makedepends=('cargo')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
  "https://raw.githubusercontent.com/ehuss/cargo-prefetch/08bbc066b608ae849a4ff8c40aa64fa3193f90b0/Cargo.lock"
)
b2sums=('f82b5eabe98839d9bf36d4355c8a8b0caf6eb1d94956f5c59968fb2049f2689f6eb3440b6b9b837a25b56e4555b3317727651337fd7de9faf8117417cbfb2cf5'
        '8e74583a23e79af4eeae91588eb7b2fc962b362f4959b682800fa631ef9581d5199059bba6ed9c3f42b72a96a29f6284715eedfd3e8042c60032cce445e64553')

prepare() {
  cd "$pkgname-$pkgver"

  # add lockfile, as it doesn't seem to be present in crate tarball
  cp "$srcdir/Cargo.lock" .

  # download dependencies
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --offline --all-features --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
}
