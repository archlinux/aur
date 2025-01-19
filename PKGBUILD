# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=graphmod-git
_pkgname="${pkgname%-git}"
pkgver=1.4.r53.g983c38f
pkgrel=6
pkgdesc="Present the module dependencies of a program as a 'dot' graph"
arch=('i686' 'x86_64')
url="https://github.com/yav/${_pkgname}"
license=('BSD-3-Clause')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
depends=('gmp')
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

package() {
  cd "$pkgname"
  stack install --local-bin-path "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et
