# Maintainer: Potato Hatsue <berberman@yandex.com>

pkgname=agda-cubical
pkgver=0.2
_agdaver=2.6.1.2
pkgrel=1
pkgdesc="An experimental library for Cubical Agda"
url="https://github.com/agda/cubical"
license=("MIT")
arch=('x86_64')
depends=("agda=$_agdaver")
makedepends=("ghc-libs")
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/agda/cubical/archive/v$pkgver.tar.gz"
cubical.agda-lib.in)
sha512sums=('19defe1e9645e9c259eb619549412587f29f2f1463ccf8a620d45b0a940faa84754fb8795c3d2eafc9feb4e503d1a24e26ae4dbcd02e30af2597ef2f91b4daba'
            '721438844cd3c8f1b4b015ba55e548705ace58870ce8eadbaa280b7f34119d24a7f7d1fb7545c9ab121043cb542e7dc55ee0f06fe075caa5b69adabafc0c84fc')

prepare() {
    cd cubical-$pkgver
    rm cubical.agda-lib
}

build() {
    cd cubical-$pkgver
    
    runhaskell --ghc-arg=-dynamic ./Everythings.hs gen-except Core Foundations Codata Experiments
    agda Cubical/README.agda
    agda Cubical/WithK.agda

}

package() {
    install -Dm644 cubical.agda-lib.in "$pkgdir"/usr/share/agda/lib/cubical.agda-lib

    cd cubical-$pkgver

    install -dm755 "$pkgdir"/usr/share/agda/lib/cubical
    cp -pr Cubical "$pkgdir"/usr/share/agda/lib/cubical/

    # Symlink to avoid writing to this place when agda-lib is present
    install -dm755 "$pkgdir"/usr/share/agda/lib/_build/$_agdaver/agda
    ln -s ../../../cubical "$pkgdir"/usr/share/agda/lib/_build/$_agdaver/agda/

    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
