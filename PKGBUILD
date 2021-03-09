# Maintainer: berberman <hatsue@typed.icu>

pkgname=haskell-hie-bios-git
pkgver=0.7.4.r2.gb5402c9
pkgrel=1
pkgdesc="Set up a GHC API session"
url="https://github.com/mpickering/hie-bios"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-aeson' 'haskell-base16-bytestring' 'haskell-conduit'
         'haskell-conduit-extra' 'haskell-cryptohash-sha1' 'haskell-extra' 'haskell-file-embed'
         'haskell-hslogger' 'haskell-optparse-applicative' 'haskell-temporary'
         'haskell-unix-compat' 'haskell-unordered-containers' 'haskell-vector' 'haskell-yaml')
makedepends=('ghc' 'haskell-hspec-expectations' 'haskell-tasty' 'haskell-tasty-expected-failure'
             'haskell-tasty-hunit')
checkdepends=('cabal-install')
provides=('haskell-hie-bios')
conflicts=('haskell-hie-bios')
source=("git+https://github.com/mpickering/hie-bios.git")
sha256sums=('SKIP')

pkgver() {
  cd hie-bios
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd hie-bios

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build $MAKEFLAGS
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd hie-bios
  runhaskell Setup test
}

package() {
  cd hie-bios

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
