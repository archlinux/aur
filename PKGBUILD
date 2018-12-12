# Maintainer: Leif Warner <abimelech@gmail.com>

_hkgname=stm-conduit
pkgname=haskell-$_hkgname
pkgver=4.0.1
pkgrel=1
pkgdesc="Provides two simple conduit wrappers around STM channels - a source and a sink."
url="https://hackage.haskell.org/package/$_hkgname"
license=("BSD")
arch=('x86_64')
depends=(haskell-async haskell-cereal-conduit haskell-conduit-extra haskell-directory haskell-exceptions
         haskell-monad-loops haskell-resourcet haskell-stm-chans haskell-transformers haskell-unliftio)
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('c776298cdc64c70ee79dd1c3bf690f8fe424f362d2d61771f9642dc5c1ea4bf4007cc837309e4b0c036cdf9a64a60da355e68fec4dac0f5ca9a33c1d6d8f18aa')

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
