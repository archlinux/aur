# Maintainer: Max <ulidtko@gmail.com>

_hkgname=stan
pkgname=haskell-stan
pkgver=0.2.1.0
pkgrel=1
pkgdesc="Haskell STatic ANalyser"
url="https://github.com/kowainik/stan"
license=("MPL-2.0")
arch=('x86_64')
depends=('ghc-libs' 'haskell-base64' 'haskell-blaze-html' 'haskell-clay' 'haskell-cryptohash-sha1'
        'haskell-dir-traverse' 'haskell-extensions' 'haskell-gitrev' 'haskell-directory-ospath-streaming'
        'haskell-microaeson' 'haskell-pretty-simple' 'haskell-relude' 'haskell-slist' 'haskell-text' 'haskell-tomland'
        'haskell-trial' 'haskell-trial-optparse-applicative' 'haskell-trial-tomland' 'haskell-unordered-containers')
makedepends=('ghc'
        'haskell-array' 'haskell-base' 'haskell-bytestring' 'haskell-colourista' 'haskell-containers'
        'haskell-dir-traverse' 'haskell-directory' 'haskell-filepath' 'haskell-ghc' 'haskell-ghc-boot-th'
        'haskell-optparse-applicative' 'haskell-process' 'haskell-scientific'
        # test deps
        'haskell-hedgehog' 'haskell-hspec' 'haskell-hspec-hedgehog'
        # fixup RUNPATH
        'chrpath'
        )
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        Setup.hs)
sha256sums=('5ac59c0836cc484476d849648e258ac83a0936d5cc11ea64182124e1ef0ac0d5'
            '5066653559d4d6134b022d66a634a17fdcf8db35d28b447e581fec284afa4689')

prepare() {
    #-- Upstream tarball doesn't come with Setup.hs, use the trivial one
    mv -v Setup.hs $_hkgname-$pkgver/
}

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

  chrpath -d "$pkgdir"/usr/lib/libHSstan-*.so

  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
