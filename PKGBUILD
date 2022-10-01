# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

_hkgname=vivid-osc
pkgname=haskell-vivid-osc
pkgver=0.5.0.0
pkgrel=1
pkgdesc='Vivid Oscillator'
url='https://vivid-synth.com/'
license=(GPL)
arch=(x86_64)
depends=(ghc-libs haskell-cereal haskell-microspec)
makedepends=(ghc uusi)
source=(https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
b2sums=('ad4fe064bd0ee4416c94f10fd0177e412fe2ef3a277c9915de583f59784cc2d2870fd5dd47f79e0a6022fa83d6a091af78cb7771767e99f45d6eb8b1a2c008e6')

prepare() {
    cd $_hkgname-$pkgver
    gen-setup
    uusi -u base $_hkgname.cabal
}

build() {
    cd $_hkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
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
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
