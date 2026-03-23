# Maintainer: agzes <agzes0@proton.me>
pkgname=lbs
_pkgname=LBS
pkgver=0.1.0
pkgrel=1
pkgdesc="A powerful per-process CPU limiter for Linux with universal Wayland & X11 focus support."
arch=('x86_64')
url="https://github.com/Agzes/LBS"
license=('MIT')
depends=('gtk4')
makedepends=('rust' 'cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v.$pkgver.tar.gz")
sha256sums=('9d8053c1ae52456dbba9e3e46eb54a933dbb0ced16d8a13273905ab84c60e253')

export CARGO_TARGET_DIR=target

prepare() {
  cd "$_pkgname-v.$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  sed -i "s/^Icon=lbs$/Icon=dev.agzes.$pkgname/" "dev.agzes.$pkgname.desktop"
}

build() {
  cd "$_pkgname-v.$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname-v.$pkgver"
  cargo test --frozen --release
}

package() {
  cd "$_pkgname-v.$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "dev.agzes.$pkgname.desktop" "$pkgdir/usr/share/applications/dev.agzes.$pkgname.desktop"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/dev.agzes.$pkgname.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
