# Maintainer: vaishnav <vaishnav.sabari.girish@gmail.com>

pkgname=typepper
pkgver=0.6.0
pkgrel=1
pkgdesc='A spicy little typing game for your terminal and browser'
arch=('x86_64' 'aarch64')
url='https://typepper.com/'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leodiegues/typepper/archive/refs/tags/v$pkgver.tar.gz")
# Run `updpkgsums` to fill this in.
sha256sums=('c1a10344da09bfe730e889a839ce2c1af00c5bef05147e3afe8f9326efa881d0')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
