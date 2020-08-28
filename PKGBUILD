# Maintainer: berberman <hatsue@typed.icu>

_hkgname=graphite
pkgname=haskell-graphite
pkgver=0.10.0.1
pkgrel=1
pkgdesc="Graphs and networks library"
url="https://github.com/alx741/graphite#readme"
license=("custom:BSD3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-quickcheck' 'haskell-cassava' 'haskell-graphviz' 'haskell-hashable' 'haskell-random' 'haskell-semigroups' 'haskell-unordered-containers' 'haskell-vector')
makedepends=('ghc' 'haskell-quickcheck' 'haskell-hspec')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('7a8366a9113c5071f5c4863a6bf10462c4274281f5523fc80f2e5539de6d0aab')

build() {
  cd $_hkgname-$pkgver    

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd $_hkgname-$pkgver
  runhaskell Setup test
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
