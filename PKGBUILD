# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.4.0-beta.14
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc='A simple image hosting service'
arch=('x86_64')
url='https://crates.io/crates/pict-rs'
license=('AGPL3')
depends=(
  'gcc-libs'
  'imagemagick'
  'ffmpeg'
  'perl-image-exiftool'
)
makedepends=('rust' 'protobuf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
sha512sums=('7680d6e9ea208db2fa879a33ad30dd13b7a4e8a522a06ed16468b5253e35e8b33faa9bdad3c37ea5e6e7eb1f69db2860823b37e00275718769df73086d28867b')
b2sums=('0c6f8d38f3e60b428874a3a755dbf9122092fc230bf7fab7abbc8dd06a3060bd5ce7254e76a9b581dcbc01d8aa2fbd673d3ba9643ba153d73763d6b37fdc2786')

prepare() {
  cd "$pkgname-$_pkgver"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$_pkgver"

  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$_pkgver"

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$_pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md ./*.toml
  cp -vr client-examples "$pkgdir/usr/share/doc/$pkgname"
}
