# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

_hkgname=vivid
pkgname=haskell-vivid
pkgver=0.5.2.0
pkgrel=2
pkgdesc='Sound synthesis with SuperCollider'
url='https://vivid-synth.com/'
license=(GPL)
arch=(x86_64)
depends=(ghc-libs haskell-binary haskell-bytestring haskell-cereal haskell-containers haskell-directory haskell-filepath haskell-hashable haskell-hashable haskell-monadrandom haskell-mtl haskell-network haskell-network haskell-process haskell-random haskell-random-shuffle haskell-random-shuffle haskell-split haskell-stm haskell-time haskell-transformers haskell-utf8-string haskell-vivid-osc haskell-vivid-supercollider supercollider)
makedepends=(ghc uusi)
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-$pkgver.tar.gz")
b2sums=('210c76629107dbce602e635ab2a316983fee1cfba5839c3f43ce1d605e2ec73781c46c1f77b41b02d86c7e0f5798cbb9181b5e06d54b4aee0b97638f8a1a93f8')

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

check() {
    cd $_hkgname-$pkgver
    runhaskell Setup test --show-details=direct
}

package() {
    cd $_hkgname-$pkgver

    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
    #install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    #rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
