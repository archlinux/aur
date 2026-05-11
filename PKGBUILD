# Maintainer: Uzanto
_pkgname=pingall
pkgname=pingall-git
pkgver=2.0.0.r42.g7042e1e
pkgrel=1
pkgdesc='Ping everything you can reach'
arch=('x86_64')
url='https://github.com/Fierthraix/pingall'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'iputils')
makedepends=('cargo' 'git')
optdepends=('avahi: resolve hostnames via avahi-resolve')
provides=('pingall')
conflicts=('pingall')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  local version
  version="$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n 1)"
  printf "%s.r%s.g%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo generate-lockfile
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
