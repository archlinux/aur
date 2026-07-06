# Maintainer: Abdullah Al-Banna

pkgname=rusbmux-git
pkgver=0.1.0.r143.gdfef992
pkgrel=3
pkgdesc="A usbmuxd replacement in pure Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/abdullah-albanna/rusbmux"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('usbmuxd' 'rusbmux')
conflicts=('usbmuxd')
options=('!lto' '!debug')
source=('git+https://github.com/abdullah-albanna/rusbmux.git')
sha256sums=('SKIP')

pkgver() {
  cd rusbmux
  local version
  version="$(cargo metadata --format-version 1 --no-deps | sed -n 's/.*"version":"\([^"]*\)".*/\1/p')"
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd rusbmux
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_LTO=false
  cargo build --release --features bin --locked
}

package() {
  cd rusbmux

  install -Dm755 "target/release/rusbmux" "$pkgdir/usr/bin/rusbmux"
  install -Dm644 "systemd/rusbmux.service" "$pkgdir/usr/lib/systemd/system/rusbmux.service"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
