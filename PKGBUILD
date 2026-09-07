# Maintainer: Hematullah Waziri <hematullahw@gmail.com>
pkgname=netman-h
_gitname=net-man-h
pkgver=0.2.1
pkgrel=1
pkgdesc='Modern NetworkManager GUI for Omarchy / Hyprland'
url="https://github.com/hematw/$_gitname"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('gtk4' 'libadwaita' 'networkmanager' 'gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('e91a470f01dbc8765bba982f6fed1d7f414d8d0eed213ce9f9cd14366eda996293a2721b7567245bcfffca9caf87998c20833a242eb2635f5bfbd35281e33fb0')

prepare() {
  cd "$_gitname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_gitname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_gitname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "data/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
