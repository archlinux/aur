# Maintainer: 71e6fd52 <71e6fd52 at gmail dot com>

_hkgname=czipwith
pkgname=haskell-czipwith
pkgver=1.0.1.3
pkgrel=1
pkgdesc="CZipWith class and deriving via TH"
url='https://hackage.haskell.org/package/czipwith'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs' )
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('59733263743a8f9506514d6d703d68583fdd120cfee320a12a72bf56e7df5e24f51328ab51b044955c30c4af1df6d21c1bd93dd6c3542330b816b81d139d129e')

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
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
