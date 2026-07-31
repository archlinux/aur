# Maintainer: w568w <w568w at outlook dot com>

_pkgname=qq-wayland-clipboard
pkgname=$_pkgname-git
pkgver=0.1.0.r3.ga918398
pkgrel=1
pkgdesc='Clipboard compatibility wrapper for Linux QQ on Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/w568w/qq-wayland-clipboard'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'linuxqq' 'xorg-server-xvfb')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git"
        'wrapped-qq.desktop')
b2sums=('SKIP'
        'd13abe15a958b75b53373db4dd3cf6c3686126cb8faa92d562225c55b346a35daea617075655dfc71a2066320fa8a3b52e65880387abe732f93773da2812538e')

pkgver() {
  cd "$_pkgname"
  local version
  version=$(sed -n 's/^version = "\([^"]*\)"/\1/p' Cargo.toml | head -n1)
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/wrapped-qq.desktop" "$pkgdir/usr/share/applications/wrapped-qq.desktop"
}
