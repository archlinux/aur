# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=yozefu
_pkgname=yozf
pkgver=0.0.11
pkgrel=1
pkgdesc="A TUI for exploring data in Kafka clusters"
arch=('x86_64')
url="https://github.com/MAIF/yozefu"
license=('Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake' 'clang' 'gcc14')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" "gcc-14.patch")
sha512sums=('7b949fad8815395f8e99cc072d1e464d8616eafec62d524404e5d95c5cd460f9e165b09398050212f9d5d88f11bfb8b9a006a9ee401279aac752cb8dfe1f998a'
  'a188a12240442cc48cb208a9aac18dea32834d601c0c6dbb1cdcb36b98dc763aff80efb920024aeba5984429e7bc4736fbea3ab71c1eb56e2b8241d2b0e9f34b')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  # gcc14 is required for rust-krb5-src
  # See <https://github.com/MAIF/yozefu/issues/93>
  patch -p1 <"$srcdir/gcc-14.patch"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
