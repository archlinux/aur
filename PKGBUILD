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
b2sums=('db4ebfe03c5504b4d1f1be1c423883e03c864558f127108e0d7dcd7a4547978e9b8648fc9cb0fd948b3060ce33bde0ea7544b667cf730c2c5fdf7d1c4824086a')

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
