# Maintainer: 71e6fd52 <71e6fd52 at gmail dot com>

_hkgname=deque
pkgname=haskell-deque
pkgver=0.4.3
pkgrel=1
pkgdesc='Double-ended queues'
url='https://hackage.haskell.org/package/deque'
license=('MIT')
arch=('x86_64')
depends=('ghc-libs' 'haskell-hashable' 'haskell-mtl' 'haskell-strict-list' 'haskell-quickcheck' 'haskell-quickcheck-instances' 'haskell-rerebase' 'haskell-tasty' 'haskell-tasty-hunit' 'haskell-tasty-quickcheck')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('640e46766c443f1fac3819ace611f762f78613c457a0aeaed7cc439f0c9e41f5126d06dec7867bc3d2b0ddc3fc030dda3e30a3b01c79cce65142e884987f21cd')

build() {
    cd $_hkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
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
