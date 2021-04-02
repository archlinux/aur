# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: hauzer <hauzer@gmx.com>

_hkgname=failure
pkgname=haskell-failure
pkgver=0.2.0.3
pkgrel=2
pkgdesc="A simple type class for success/failure computations."
url="https://hackage.haskell.org/package/${_hkgname}"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('ef8c9904d899381a281ee79235054af6bd156d2b2819e70bcd2a122c1c505c10311189f9280c39bd836c0f3ba35bc7536ce83b58a42978616ebd89c64d692c96')

build() {
    cd $_hkgname-$pkgver
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build $MAKEFLAGS
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
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
