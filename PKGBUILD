# Maintainer: Firas Zaidan <firas@zaidan.de>

_hkgname=hmenu
pkgname=haskell-hmenu
pkgver=0.3.0.0
pkgrel=1
commit=5d35f488e74c2ba911408dab7ff0370a58624607
pkgdesc="CLI fuzzy finder and launcher"
url="https://hackage.haskell.org/package/hmenu"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-missingh' 'haskell-tomland' 'haskell-bytestring-lexing' 'haskell-double-conversion' 'haskell-posix-paths')
makedepends=('ghc')
#source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
source=(https://github.com/slotThe/hmenu/archive/$commit.zip)
sha256sums=('a5b35bd028af2db906102b40ec2ab7e78f2b0f256f23da2ee222e80db543b4e5')

build() {
  #cd $_hkgname-$pkgver
  cd $_hkgname-$commit
  echo -e "import Distribution.Simple\nmain = defaultMain" > Setup.hs

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' 

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  #cd $_hkgname-$pkgver
  cd $_hkgname-$commit

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
