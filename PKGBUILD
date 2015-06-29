# Maintainer: André van Delden <andre.van.deldenX@Xuni-bremen.de>

_hkgname=vinyl-gl
pkgname=haskell-vinyl-gl
pkgver=0.3.0.1
pkgrel=1

pkgdesc="Using Data.Vinyl records to carry GLSL uniform parameters and vertex data enables library code to reflect over the types of the data to facilitate interaction between Haskell and GLSL. See the examples directory in the repository."

url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('any')
depends=('ghc' 'haskell-base>=4.6' 'haskell-base<5'
         'haskell-containers>=0.5'
         'haskell-glutil>=0.6.4' 'haskell-linear>=1.1.3'
         'haskell-opengl>=2.8' 'haskell-tagged>=0.4'
         'haskell-transformers>=0.3' 'haskell-vector>=0.10'
         'haskell-vinyl>=0.5.1' 'haskell-vinyl<0.6')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install="${pkgname}.install"
sha512sums=('b2661c76d331532be8698a0e6e02fadb2d358d85177f01c44320283be4f82cfa73d723166dfdf73406a5d671ac5a3c488cc060c8d5d1970985d8a9ba4aff0d91')

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
