# Maintainer: Hematullah Waziri <hematullahw@gmail.com>
pkgname=netman-h
_gitname=net-man-h
pkgver=0.2.0
pkgrel=1
pkgdesc='Modern NetworkManager GUI for Omarchy / Hyprland'
url="https://github.com/hematw/$_gitname"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('gtk4' 'libadwaita' 'networkmanager' 'gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d54e2a2ac3de9ab2de0b9a6d6cf21c997bb599f065af6f0e306c5b77ecae0a553485434c25c430aa6815ff77c8cca13456f4bb011ef465af963710f1d2561d3f')

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
