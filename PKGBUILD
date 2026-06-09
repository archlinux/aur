# Maintainer: LargeModGames <jay.sankatsing9@gmail.com>
pkgname=steamie
pkgver=0.4.2
pkgrel=1
pkgdesc="A terminal-native Steam client written in Rust"
arch=('x86_64')
url="https://github.com/LargeModGames/steamie"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('steamie-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LargeModGames/steamie/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de98be01bc649cd4e93518cb4fe43c00b9e49b2f33084cf5ca307a49c1f42dbd')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CARGO_PROFILE_RELEASE_LTO=false
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p steamie
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen -p steamie-core
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/steamie" "$pkgdir/usr/bin/steamie"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
