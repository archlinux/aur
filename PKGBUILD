# Maintainer: André van Delden <andre.van.deldenX@Xuni-bremen.de>

_hkgname=GLUtil
pkgname=haskell-glutil
pkgver=0.8.6
pkgrel=1

pkgdesc="Helpers for working with shaders, buffer objects, and textures in OpenGL."

url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('any')
depends=('ghc' 'haskell-cpphs'
         'haskell-array'
         'haskell-base>=4.2' 'haskell-base<5'
         'haskell-bytestring'
         'haskell-containers>=0.5'
         'haskell-directory' 'haskell-filepath'
         'haskell-juicypixels>=3' 'haskell-linear>=1.1.3'
         'haskell-opengl>=2.9.2' 'haskell-opengl<2.13'
         'haskell-openglraw>=1.1' 'haskell-transformers>=0.3'
         'haskell-vector>=0.7')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install="${pkgname}.install"
sha512sums=('8d2be003aa6a624dd0d56214d25a230494b57707af0d5ddd1a1e9cfb3b91303a8f195ef8e81980bc4cfa014e0fa828ad550217ca555c6c53ad4731a008059601')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
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
