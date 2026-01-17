# Maintainer: Sam Newman <snewman.aa@gmail.com>
pkgname=find-active-git
_pkgname=find-active
pkgver=r2.1e28c10
pkgrel=1
pkgdesc="A simple cli that enables muscle memory workspace switching in hyprland"
arch=('x86_64')
url="https://github.com/snewman-aa/find-active"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
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
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
