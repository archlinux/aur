# Maintainer: Tuomas Rinne <tuomas.rin@protonmail.com>

pkgname=('hyprland-focused-booster')
pkgver=0.1.2
pkgrel=1
arch=('x86_64')
url='https://github.com/tumrin/hyprland-focused-booster'
license=('MIT')
pkgdesc='Active window VRAM booster for Hyprland'
makedepends=('cargo')
depends=('dmemcg-booster' 'glibc' 'systemd')
install=hyprland-focused-booster.install
source=("https://github.com/tumrin/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1a10a68312efd65d02ad1b71cc9ca7aeeb10a1f4597499cdd8616e2b9fcd2de1')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/$pkgname-$pkgver" || exit
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$pkgname-$pkgver" || exit
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit
  install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 "$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
