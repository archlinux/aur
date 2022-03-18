# Maintainer: Jonathan Birk <cafce25@gmail.com>

pkgname=dice
pkgver=0.1.0.1
pkgrel=1
pkgdesc="Simplistic D&D style dice-rolling system."
url='https://github.com/lambdabot/dice'
license=("public domain")
arch=('x86_64')
depends=('ghc-libs' 'haskell-mwc-random' 'haskell-random-fu')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "0001-Support-GHC-9.patch")
sha256sums=('c336edc4fd27b5700507cbe4c6a153c4f047ab51264a911ad07b383ef064cbcb'
            '50aa1ca162fcbf681299b28636e10c58ad304de433b37d2d29dcd6b5d5230ae5')

prepare() {
    cd $pkgname-$pkgver
    patch -p1 < ../0001-Support-GHC-9.patch
}

build() {
    cd $pkgname-$pkgver

    if (( CHECKFUNC )); then
        _opts=('--enable-tests')
    else
        _opts=('--disable-tests')
    fi

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname "${_opts[@]}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid --ghc-option=-fllvm
    runhaskell Setup build $MAKEFLAGS
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
    cd $pkgname-$pkgver
    runhaskell Setup test --show-details=direct
}

package() {
    cd $pkgname-$pkgver

    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
}
