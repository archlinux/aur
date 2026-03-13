# Maintainer: Ardox <ardox@axos-project.com>
pkgname=hypnos-git
_pkgname=hypnos
pkgver=1.0.0.r12.gabc123
pkgrel=1
pkgdesc="A Wayland idle time based action daemon (git version)"
arch=('x86_64')
url="https://github.com/axos-project/hypnos"
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('wayland-protocols' 'libnotify' 'systemd')
makedepends=('git' 'cargo')
install=hypnos-git.install
source=("git+https://github.com/axos-project/hypnos.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
