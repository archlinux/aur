# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=autokernel
pkgver=2.0.2
pkgrel=1
pkgdesc='A tool for managing your kernel configuration that guarantees semantic correctness'
url='https://github.com/oddlama/autokernel'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'sqlite')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oddlama/autokernel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43e88a77630c20986eda18849a83ca0b813c65d98b53994002fa4a29a8aac9ac')
b2sums=('4f44ff523ccaa11301eb3871e70f1b14fae16f0c58f55ea4901017dd30b1c007af2d0973cf33af52d7fdf8942ed881244009a44fb336d4f8a0d8f375cf3dd8df')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target $_target

  # rlua 0.19.4 does not compile with recent rustc: the return type of `self.call(())?` falls back to `!`
  sed -i 's/self\.call(())?;/self.call::<_, ()>(())?;/' \
    "${CARGO_HOME:-$HOME/.cargo}"/registry/src/*/rlua-0.19.4/src/context.rs
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --features 'index'
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/autokernel{,-index}

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
