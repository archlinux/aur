# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_hkgname=parsec-permutation
pkgname=haskell-parsec-permutation
pkgver=0.1.2.0
pkgrel=1
pkgdesc="Applicative permutation parser for Parsec intended as a replacement"
url="https://github.com/h/parsec-permutation"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('25fdbd6246ad093173fbbc8ef7f8d6805b429bcd4ed6afeb3c482b07a848d2f206301642db8edf68915a3fe184e56af2166efde3970681a08361f5384a667d2d')

build() {
    cd $srcdir/$_hkgname-$pkgver
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
    cd $srcdir/$_hkgname-$pkgver
    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
