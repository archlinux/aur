# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: hauzer <hauzer@gmx.com>

_hkgname=crypto-random-api
pkgname=haskell-crypto-random-api
pkgver=0.2.0
pkgrel=3
pkgdesc="Simple random generators API for cryptography related code"
url="https://hackage.haskell.org/package/${_hkgname}"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-entropy')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('8f7df05e54e053456e3ebe9394b19beb2a37dfed30cfb5fb673f591415dc6fabe105af51e838fbe73ef078906d94562080ca465b0c6b4e1537bd4a6e066244f7')

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
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
