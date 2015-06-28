# Maintainer: André van Delden <andre.van.deldenX@Xuni-bremen.de>

_hkgname=GLUtil
pkgname=haskell-glutil
pkgver=0.7.4
pkgrel=1

pkgdesc="Helpers for working with shaders, buffer objects, and textures in OpenGL."

url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-cpphs' 'haskell-juicypixels>=3' 'haskell-linear>=1.1.3'
         'haskell-opengl>=2.9' 'haskell-openglraw>=1.1' 'haskell-vector>=0.7')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install="${pkgname}.install"
sha512sums=('0af7a026a98d96114ffad30b82588dc03e8c92d1f99a3dd241144b36db905d8d6dc96dd608c27da4ae82b5cafc833041c94270c52f2458cfc4c32cbe9f1eefff')

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
