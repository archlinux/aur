# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=stack-clean-old-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.5.1.r1.g899235a
pkgrel=4
pkgdesc='Manage Haskell stack snapshot builds and ghc versions (static build)'
arch=('i686' 'x86_64')
url="https://github.com/juhp/${_pkgname}"
license=('BSD-3-Clause')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
depends=('gmp' 'ncurses')
makedepends=('git' 'stack')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  stack config set resolver lts-22.22 # ghc-9.6.5
}

build() {
  cd "$pkgname"
  stack build
}

check() {
  cd "$pkgname"
  stack test
}

package() {
  cd "$pkgname"
  stack install --local-bin-path "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et
