# Maintainer: 71e6fd52 <71e6fd52 at gmail dot com>

_hkgname=butcher
pkgname=haskell-butcher
pkgver=1.3.3.2
pkgrel=1
pkgdesc="Chops a command or program invocation into digestable pieces."
url='https://hackage.haskell.org/package/butcher'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs' 'haskell-bifunctors' 'haskell-deque' 'haskell-extra' 'haskell-free' 'haskell-hspec' 'haskell-microlens' 'haskell-microlens-th' 'haskell-multistate' 'haskell-unsafe' 'haskell-void')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('98dece006460c00280ef16ea66d91405644e10e496059e5f1412ec8461674f1eca6a3d429800611329351b35d60855d69f21be9d9a96ed027b6e4b5f2c000703')

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
