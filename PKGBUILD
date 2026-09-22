# Maintainer: agzes <agzes0@proton.me>
pkgname=totray
_pkgname=ToTray
pkgver=0.2.0
pkgrel=1
pkgdesc="AutoRun utility for hyprland."
arch=('x86_64')
url="https://github.com/Agzes/ToTray"
license=('MIT')
depends=('gtk4')
makedepends=('rust' 'cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v.$pkgver.tar.gz")
sha256sums=('2286b071497e57e013883617cbb46cb2284d819de9687d4ee3d5bbb286968fa6')

prepare() {
  cd "$_pkgname-v.$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-v.$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname-v.$pkgver"
  cargo test --frozen
}

package() {
  cd "$_pkgname-v.$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
