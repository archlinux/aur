# Maintainer: Leif Warner <abimelech@gmail.com>

_hkgname=binary-tree
pkgname=haskell-$_hkgname
pkgver=0.1.0.0
pkgrel=1
pkgdesc="Binary trees and associated instances"
url="https://hackage.haskell.org/package/$_hkgname"
license=("MIT")
arch=('x86_64')
depends=('ghc-libs' 'haskell-deepseq' 'haskell-ghc-prim')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('3f9eea03a4cfe1bb22d39a2991783e688d8f9f9f06b1bb5ef8fbd4f8618c82937aae13e8c3719eb85bc1acee1ac3022bc7c2ed3a4f8a15b49e1166e5708d4dc6')

build() {
  cd "$srcdir"/${_hkgname}-${pkgver}
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
      --prefix=/usr --docdir=/usr/share/doc/$pkgname \
      --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir"/${_hkgname}-${pkgver}
  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  rm -f "$pkgdir"/usr/share/doc/${pkgname}/LICENSE
}
