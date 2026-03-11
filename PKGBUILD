# Maintainer: lifespirit <life@crabs.pro>

pkgname=pict-rs
pkgver=0.5.19
pkgrel=2
pkgdesc='A simple image hosting service'
arch=('x86_64')
url='https://git.asonix.dog/asonix/pict-rs'
license=('AGPL3')
depends=(
  'glibc'
  'gcc-libs'
  'imagemagick'
  'ffmpeg'
  'perl-image-exiftool'
)
makedepends=('git' 'rust' 'protobuf')
options=('!lto')
_commit='c20a7db2d91c118696c61acb45cb00ca073fda49'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release
}

check() {
  cd "$pkgname"

  cargo test --frozen
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md ./*.toml
  cp -vr client-examples "$pkgdir/usr/share/doc/$pkgname"
}
