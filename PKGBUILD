# Maintainer: Umar Alfarouk <medrivia@gmail.com>

pkgname=hashline
pkgver=0.9.16
pkgrel=1
pkgdesc="Hash-anchored line editing for AI coding agents — O(1) line addressing via content-hashed anchors and drift-safe surgical patches"
arch=('x86_64' 'aarch64')
url="https://github.com/quangdang46/hashline"
license=('MIT' 'Apache-2.0')
depends=('libgcc')
makedepends=('cargo')
conflicts=('hashline-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/quangdang46/hashline/v$pkgver/MIT")
sha256sums=('1172445d389c9d439d3cf0e936c2e143ff4155aa8c0c20f1314f15b973f0ade0'
            'ebb5e71bc9cf9a2b324d71576d646d2f69d613672dc12fca3b7ecc0f040596d7')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/hashline "$pkgdir/usr/bin/hashline"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
