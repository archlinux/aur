# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

_hkgname=vivid-supercollider
pkgname=haskell-vivid-supercollider
pkgver=0.4.1.2
pkgrel=1
pkgdesc='Vivid + Supercollider'
url='https://vivid-synth.com/'
license=(GPL)
arch=(x86_64)
depends=(ghc-libs haskell-split haskell-utf8-string haskell-vivid-osc)
makedepends=(ghc uusi)
source=(https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
b2sums=('6e7336b192a7ea460bd1cd39ea367b5ebf8248d2e0d7f491a7adc258d61865170835ebf74d70ad8615fe04717c14c513316d1e11a04cc4f07b09acf36541fef5')

prepare() {
    cd $_hkgname-$pkgver
    gen-setup
    uusi -u base $_hkgname.cabal
}

build() {
    cd $_hkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --disable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid --ghc-option=-fllvm
    runhaskell Setup build $MAKEFLAGS
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

#check() {
#    cd $_hkgname-$pkgver
#    runhaskell Setup test --show-details=direct
#}

package() {
    cd $_hkgname-$pkgver

    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
    #install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    #rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
