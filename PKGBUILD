# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=parui
pkgver=1.0.15
pkgrel=1
pkgdesc="Simple TUI frontend for paru or yay"
arch=('x86_64')
url="https://github.com/Vonr/parui"
license=('MIT')
depends=('git' 'pacman' 'gcc-libs')
makedepends=('cargo')
optdepends=('paru: default AUR interface'
            'yay: alternative AUR interface')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2bca38ae1b452ea374d0a3ae4a1041ab72fb276f7377cef6d7ba63d05059ca487ee610458590c7ab2dd9d1237d7f762c75cf2bd6928179a112f5a4fdd73a9395')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
