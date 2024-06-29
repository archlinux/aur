# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Emanuel Couto <unit73e at gmail dot com>

_hkgname=cab
pkgname=cab
pkgver=0.2.21
pkgrel=5
pkgdesc="A maintenance command of Haskell cabal packages."
url="https://www.mew.org/~kazu/proj/cab/en/"
license=('BSD-3-Clause')
arch=('i686' 'x86_64')
depends=(haskell-resourcet glibc haskell-conduit haskell-hashable numactl haskell-integer-logarithms
bash haskell-random haskell-bitvec haskell-unliftio-core haskell-primitive haskell-zlib
haskell-data-array-byte haskell-vector-stream zlib haskell-conduit-extra haskell-typed-process
haskell-split haskell-streaming-commons haskell-mono-traversable haskell-splitmix
haskell-scientific gmp haskell-async haskell-vector haskell-network libffi haskell-attoparsec
haskell-unordered-containers haskell-vector-algorithms)
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('2f05e1e0fad999cbbf99805c2b3609d53bae8492fd1deed17a721aa2ead13a1f4acfe6c95522097dd1dd01d89468e34856d4cf89e540c1d01ab9cc569f060541')

build() {
  cd "$_hkgname-$pkgver"

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir="/usr/share/doc/$pkgname" --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build $MAKEFLAGS
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$_hkgname-$pkgver"

  install -D -m744 register.sh "$pkgdir/usr/share/haskell/register/$pkgname.sh"
  install -D -m744 unregister.sh "$pkgdir/usr/share/haskell/unregister/$pkgname.sh"
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
