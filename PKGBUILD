# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=yozefu
_pkgname=yozf
pkgver=0.0.12
pkgrel=1
pkgdesc="A TUI for exploring data in Kafka clusters"
arch=('x86_64')
url="https://github.com/MAIF/yozefu"
license=('Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake' 'clang' 'gcc14')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" "gcc-14.patch")
sha512sums=('1b7f22a08231733f26bead49df254d2f8ea232a91faada5d78ed485527e9f7984f76113dc9ceff5de198ba9dcf26491e73d70f119fbd3f3a8257b01ac683f11c'
  '230e9b45f98b18b40254fba2b6afbcb8e4add50b06264977989ac4549009bd4e89d7c37f384fe7c107a288bbeb2695b8fe0e06cbd0790904f568f5bdddbfd133')
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
  RUSTFLAGS="--cfg tokio_unstable" cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  RUSTFLAGS="--cfg tokio_unstable" cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
