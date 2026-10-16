# Maintainer: Matt Moyles <matt@mattmoyles.com>
pkgname=ans2irc
pkgver=0.1.0
pkgrel=1
pkgdesc='Convert ANSI art to mIRC-coloured text that fits in IRC messages'
arch=('x86_64' 'aarch64')
url='https://github.com/mmoyles87/ans2irc'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5135fdb7cf904dab761cb7236b6c9b7fe4fd9852689541f1f83588ff3205086')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/ans2irc "$pkgdir/usr/bin/ans2irc"
  install -Dm644 doc/ans2irc.1 "$pkgdir/usr/share/man/man1/ans2irc.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
