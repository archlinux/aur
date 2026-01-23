# Maintainer: Syed Insaf <syedinsaf@proton.me>
# GitHub: https://github.com/syedinsaf/otaripper

pkgname=otaripper
pkgver=2.1.0
pkgrel=1
pkgdesc="Ultra-fast partition extractor for Android OTA .zip and payload.bin files"
arch=('x86_64' 'aarch64')
url="https://github.com/syedinsaf/otaripper"
license=('Apache-2.0')

depends=('glibc')
makedepends=('cargo' 'rust>=1.93.0' 'protobuf' 'pkgconf')

provides=('otaripper')
conflicts=('otaripper-bin')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9bd7e6afddd8f68f5632a2667880d90f95661a0f12b15507256905ee6bb06056')

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target

  # Avoid Arch hardening flags breaking native crates
  unset LDFLAGS CFLAGS CPPFLAGS

  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  target/release/otaripper --help >/dev/null
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/otaripper \
    "$pkgdir/usr/bin/otaripper"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
