# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Dino Morelli <dino@ui3.info>

pkgname=hlint-static-git
_pkgname="${pkgname%-static-git}"
pkgver=3.8.r68.g7dfba720
pkgrel=4
pkgdesc='Haskell source code suggestions'
arch=('i686' 'x86_64')
url="https://github.com/ndmitchell/${_pkgname}"
license=('BSD-3-Clause')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
depends=('gmp')
makedepends=('git' 'cabal-install' 'ghc')
optdepends=('haskell-apply-refact: automatically apply suggested refactorings')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cabal update hackage.haskell.org,$(TZ=UTC date +@%s --date='today 00:00')
  cabal configure --prefix=/usr --docdir=/usr/share/doc/"$pkgname" \
    --enable-tests
  cabal build --only-dependencies
}

build() {
  cd "$pkgname"
  cabal build --offline
}

check() {
  cd "$pkgname"
  cabal run -- hlint --test
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cabal install --install-method=copy --installdir "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et
