# Maintainer: Ben Kepner <u6bkep at gmail dot com>

pkgname=barwatch-git
_pkgname=barwatch
pkgver=0.4.0.r65.g54cf06d
pkgrel=1
pkgdesc="Watch Beyond All Reason replays together in rooms on a barwatch server"
arch=('x86_64')
url="https://github.com/u6bkep/barwatch"
license=('MIT OR Apache-2.0')
# vulkan-icd-loader, libxkbcommon and wayland are loaded at run time (not linked);
# xdg-utils opens links in the browser.
depends=('glibc' 'libgcc' 'hicolor-icon-theme' 'vulkan-icd-loader' 'libxkbcommon' 'wayland' 'xdg-utils')
makedepends=('cargo' 'git')
optdepends=('p7zip: fallback when an engine archive cannot be unpacked natively'
            'libx11: run under X11 instead of Wayland')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto' '!debug')
source=("git+https://github.com/u6bkep/barwatch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local base
  base="$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -1)"
  printf '%s.r%s.g%s' "$base" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p barwatch
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p barwatch -p barwatch-core
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/barwatch "$pkgdir/usr/bin/barwatch"
  install -Dm644 packaging/barwatch.desktop "$pkgdir/usr/share/applications/barwatch.desktop"
  install -Dm644 packaging/barwatch.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/barwatch.svg"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
