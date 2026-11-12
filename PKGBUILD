# Maintainer: Tuomas Rinne <tuomas.rin@protonmail.com>

pkgname=('hyprland-focused-booster')
pkgver=0.1.7
pkgrel=1
arch=('x86_64')
url='https://codeberg.org/tumrin/hyprland-focused-booster'
license=('MIT')
pkgdesc='Active window VRAM booster for Hyprland'
makedepends=('cargo')
depends=('dmemcg-booster' 'glibc' 'systemd')
install=hyprland-focused-booster.install
source=("https://codeberg.org/tumrin/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('46d20b90e48d93bcde07b98db4180b24829d5935eda3179782a5c88c0930328a')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/$pkgname" || exit
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$pkgname" || exit
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname" || exit
  install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 "$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
