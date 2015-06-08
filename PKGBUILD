# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=bio
pkgname=haskell-bio
pkgver=0.5.3
pkgrel=1
pkgdesc="A bioinformatics library"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-quickcheck>=2.0' 'haskell-array' 'haskell-binary>=0.4' 'haskell-bytestring>=0.9.1' 'haskell-containers' 'haskell-directory' 'haskell-mtl' 'haskell-old-time' 'haskell-parallel' 'haskell-parsec' 'haskell-process' 'haskell-random' 'haskell-tagsoup>=0.8')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    sed -i -e "s, && <0.5,,g" bio.cabal
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
}
md5sums=('b5002c48bcee7741264ed6e46ac7a5ca')
