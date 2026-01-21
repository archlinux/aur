# Maintainer: Sam Newman <snewman.aa@gmail.com>
_pkgname=halo
pkgname=halo-git
pkgver=r4.57aa67d
pkgrel=1
pkgdesc="A radial 'run or raise' menu and utility for Hyprland"
arch=('x86_64')
url="https://github.com/snewman-aa/halo"
license=('MIT')
depends=('gcc-libs' 'gtk4' 'gtk4-layer-shell')
makedepends=('cargo' 'git' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  if git describe --long --tags --abbrev=7 &>/dev/null; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
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

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/hypraise" "$pkgdir/usr/bin/hypraise"
  install -Dm755 "target/release/halo" "$pkgdir/usr/bin/halo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
