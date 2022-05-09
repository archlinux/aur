# Maintainer: Ben Mitchell <bjosephmitchell@gmail.com>
_pkgname=opman
pkgname="$_pkgname-git"
pkgver=r9.98f4c09
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='Opinionated ArchLinux Package Manager (WIP)'
arch=('any')
url="https://github.com/CRISPYricePC/$_pkgname"
license=('MIT')
depends=('pacman')
makedepends=('cargo')
provides=('opman')
source=("${_pkgname}::git+$url.git")
md5sums=('SKIP')

prepare() {
  cd $_pkgname

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_pkgname

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd $_pkgname

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}