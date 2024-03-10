# Maintainer: Axel Kappel <aur@kappel.dev>
pkgname='simp'
pkgver=3.5.2
pkgrel=0
pkgdesc="A simple and fast image manipulation program"
arch=('x86_64')
url="https://github.com/Kl4rry/simp"
license=('Apache-2.0')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'dav1d')
makedepends=('cargo' 'cargo-about' 'git' 'openssl' 'nasm' 'gendesk' 'clang' 'mold')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
md5sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  mimes='image/bmp;image/png;image/gif;image/jpeg;image/svg+xml;image/x-icon;image/tiff;image/webp;image/tga'
  gendesk -f --pkgname=$pkgname --pkgdesc="$pkgdesc" --exec=simp --terminal=false --icon="$pkgname.png" --mimetypes=$mimes --categories='Graphics;ImageProcessing'
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 -T $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 -T icon.png "$pkgdir/usr/share/icons/$pkgname.png"
}