# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=rsagl
pkgname=haskell-rsagl
pkgver=0.6.0.1
pkgrel=1
pkgdesc="The RogueStar Animation and Graphics Library"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('haskell-array'
         'haskell-arrows'
         'haskell-containers'
         'haskell-data-memocombinators'
         'haskell-deepseq'
         'haskell-mtl'
         'haskell-old-time'
         'haskell-opengl'
         'haskell-openglraw'
         'haskell-parallel'
         'haskell-parsec'
         'haskell-random'
         'haskell-rsagl-frp'
         'haskell-rsagl-math'
         'haskell-stm'
         'haskell-vec'
         'haskell-vec-openglraw')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('5510d9ec4a3049eecdf9aea1e7ee318b')
install=${pkgname}.install

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
