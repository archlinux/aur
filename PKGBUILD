# Maintainer: MajorX234 <majorx234 at gmail com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Austin Robinson <austin.rbsn@gmail.com>

_hkgname=GLUT
pkgname=haskell-glut
pkgver=2.7.0.16
pkgrel=3
pkgdesc="A binding for the OpenGL Utility Toolkit"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-opengl>=2.8.0.0' 'haskell-openglraw>=1.3.0.0'
         'haskell-array>=0.3' 'haskell-containers>=0.3' 'freeglut')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
sha512sums=('0ff118991041ebd602f156241e85c5e04c5628890dad55ecefd31c1d70fb283097a8520de1e29c62537b9435a619c048a6d74c31372eb97960d847a129aba0ea')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}

    runhaskell Setup configure -O --enable-shared --enable-debug-info --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build $MAKEFLAGS
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}

    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
