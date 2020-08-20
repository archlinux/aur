# Maintainer: berberman <hatsue@typed.icu>

_hkgname=shellmet
pkgname=haskell-shellmet
pkgver=0.0.3.1
pkgrel=1
pkgdesc="Shellmet provides easy and convenient way to call shell commands from Haskell programs."
url="hhttps://github.com/kowainik/shellmet"
license=('MPL2')
arch=('x86_64')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        Setup.hs
)
sha256sums=('b9f084f47a6ae711b1e505e2f90d8d202d94f62950be98ceafc668b306473b25' '1e1679046e10c31286fee3e631e57e4ef60c89e562270c8a2a7131c051959916')

prepare(){
  cd $_hkgname-$pkgver

  cp ../Setup.hs Setup.hs
  # disable executables
  sed -i '69,79d' $_hkgname.cabal
}

build() {
  cd $_hkgname-$pkgver    
    
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname \
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
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
