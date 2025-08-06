# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=yozefu
_pkgname=yozf
pkgver=0.0.13
pkgrel=1
pkgdesc="A TUI for exploring data in Kafka clusters"
arch=('x86_64')
url="https://github.com/MAIF/yozefu"
license=('Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake' 'clang' 'gcc14')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" "gcc-14.patch")
sha512sums=('4b454a86e42274cff0dc2684b1398b3dba02c721299e28638fa550898fd7d6f1b8def09a42199b241b548953f0f7f228d8b09423bc9baa496eeeb5f40ea1d730'
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
