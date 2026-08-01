# Maintainer: sqzer (hyukjin an) <110329244+sqzer-x@users.noreply.github.com>

pkgname=ommp
pkgver=0.1.1
pkgrel=2
pkgdesc="Oh My Music Player — a standalone terminal music player"
arch=('x86_64' 'aarch64')
url="https://github.com/sqzer-x/ommp"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'alsa-lib')
makedepends=('cargo')
optdepends=(
  'ttf-nerd-fonts-symbols: interface icons'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c17d075d59923985b8b3153ea1287627af817645dca3b804674fd39ad447b5ec')

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
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
