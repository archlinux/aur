# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=reason
pkgver=0.3.5
pkgrel=1
pkgdesc='A shell for research papers'
arch=('x86_64')
url='https://github.com/jaywonchung/reason'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$pkgname-$pkgver-Cargo.lock::https://raw.githubusercontent.com/jaywonchung/reason/3ab7b662510a52ea9ed1e65450c914d7ef65ae62/Cargo.lock"
)
sha512sums=('0281d8837cdde7dcffe70c413f6acb6878f33c6325321fa5a489b9fb181f9de090963c60b2e69dca93ee981f07170becd061a03ce46ab838cd7b041352f84c1c'
            '1de5d4a6b18f8c81b375cb4ef6dad734b228514e192d7c40af02cfc2adc6e09019f0f9d42ec94313a7fa359f39776137341cb754418ac2614ff1613c5a097462')
b2sums=('ea643a239959ebdd760bd1cbc4a70c3a7dbe59e674e56c41e0a0a5de45fc03249b39ecb9317a1c7b672b75d025be58421b1394261b242a44000f4efc45d6722e'
        '9048fbb26915557c359835dfdd8d0c6da5faaf6e10bb99410882ba4ce8fd48799c78f7c8f0bbd3159f6d2cc12cf769ed55b1035ae8f9975fd89f728b591222e1')

prepare() {
  cd "$pkgname-$pkgver"

  cp -vf "$srcdir/$pkgname-$pkgver-Cargo.lock" Cargo.lock

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/reason

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr examples man "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
