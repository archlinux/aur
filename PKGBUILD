# Maintainer: Bartlomiej Dudek <dooodek at protonmail dot com>
pkgname=ccd-nav
_binname=ccd
pkgver=0.1.0
pkgrel=1
pkgdesc='Recursive cd - find and jump into nested directories instantly'
arch=('x86_64' 'aarch64')
url='https://github.com/doodek/ccd'
license=('MIT')
depends=()
makedepends=('cargo')
provides=('ccd')
conflicts=('ccd')
source=("$_binname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('54ac4932ebb7c549fef340f0410dbd813acac83a4da4dc15f4dc9fdd6b6d88a0')

prepare() {
  cd "$_binname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_binname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_binname-$pkgver"
  install -Dm755 "target/release/$_binname" "$pkgdir/usr/bin/$_binname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 shell/ccd.bash "$pkgdir/usr/share/$_binname/ccd.bash"
  install -Dm644 shell/ccd.zsh "$pkgdir/usr/share/$_binname/ccd.zsh"
  install -Dm644 shell/ccd.fish "$pkgdir/usr/share/fish/vendor_functions.d/ccd.fish"
}
