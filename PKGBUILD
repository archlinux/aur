# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Arch Haskell Team <>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=haskell-zip-archive
_hkgname=zip-archive
pkgver=0.2.3.6
pkgrel=1
pkgdesc="Library for creating and modifying zip archives."
url="http://github.com/jgm/zip-archive"
license=(custom:BSD3)
arch=('i686' 'x86_64')
makedepends=('ghc')
options=('staticlibs')
depends=(haskell-array haskell-binary haskell-bytestring haskell-containers
         haskell-digest haskell-directory haskell-filepath haskell-mtl
         haskell-pretty haskell-utf8-string haskell-zlib)
source=("http://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/${_hkgname}-${pkgver}.tar.gz")
install=$pkgname.install
sha256sums=('176849b25d8a1d36813affe081659e118c89bca17b13564d60c1cc27a07abc09')

build() {
  cd "$srcdir/$_hkgname-$pkgver"

  runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname \
    --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd ${srcdir}/${_hkgname}-${pkgver}
  install -Dm744 register.sh "$pkgdir/usr/share/haskell/$pkgname/register.sh"
  install -m744 unregister.sh "$pkgdir/usr/share/haskell/$pkgname/unregister.sh"
  install -dm755 "$pkgdir/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/$pkgname/html "$pkgdir/usr/share/doc/ghc/html/libraries/$_hkgname"
  runhaskell Setup copy --destdir="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
