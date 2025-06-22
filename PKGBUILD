# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=hasktags-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.73.0.rXX.gXXXXXXX
pkgrel=3
pkgdesc='Produces ctags "tags" and etags "TAGS" files for Haskell programs'
arch=('i686' 'x86_64')
url="https://github.com/MarcWeber/${_pkgname}"
license=('BSD-3-Clause')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
depends=('gmp')
makedepends=('git' 'cabal-install' 'ghc')
source=("$pkgname::git+$url.git")
source+=("${pkgname}-PR102.patch::$url/pull/102.patch")
sha256sums=('SKIP'
            'c4b27d612cb1de0b62e24ba07d7056200b8a130e8c4e462a30ff73b631d8c3b1')

pkgver() {
  cd "$pkgname"
  git describe --tags --long \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  # PR 102: Fix tuple patterns
  git apply ../"$pkgname"-PR102.patch

  cabal update
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
  cabal test
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cabal install --install-method=copy --installdir "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et
