# Maintainer: Justin ! <just1602@riseup.net>

_pkgname='ttrack'
pkgname="$_pkgname-git"
pkgver=r16.b8213c7
pkgrel=3
pkgdesc='simple CLI time tracker'
arch=('x86_64')
url='https://github.com/just1602/ttrack'
license=('GPL')
makedepends=("cargo")
provides=("$_pkgname")
source=("git+$url")
b2sums=('SKIP')

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --frozen --release --target-dir target
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --frozen
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/ttrack "${pkgdir}/usr/bin/ttrack"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
