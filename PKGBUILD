# Maintainer: Umar Alfarouk <medrivia@gmail.com>

pkgname=hashline
pkgver=0.9.24
pkgrel=2
pkgdesc="Hash-anchored line editing for AI coding agents — O(1) line addressing via content-hashed anchors and drift-safe surgical patches"
arch=('x86_64' 'aarch64')
url="https://github.com/quangdang46/hashline"
license=('MIT' 'Apache-2.0')
depends=('libgcc')
makedepends=('cargo')
conflicts=('hashline-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/quangdang46/hashline/v$pkgver/LICENSE")
sha256sums=('46474cafe9281e305603f5b75659c3c98832645893bfa610d699f492c5ea7197'
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
