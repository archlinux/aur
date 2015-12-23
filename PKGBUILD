# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=shakespeare
pkgname=haskell-shakespeare
pkgver=2.0.7
pkgrel=1
pkgdesc="A toolkit for making compile-time interpolated templates"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:MIT')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-aeson' 'haskell-blaze-html' 'haskell-blaze-markup' 'haskell-bytestring' 'haskell-containers' 'haskell-directory' 'haskell-exceptions' 'haskell-parsec' 'haskell-process' 'haskell-scientific>=0.3.0.0' 'haskell-template-haskell' 'haskell-text' 'haskell-time' 'haskell-transformers' 'haskell-unordered-containers' 'haskell-vector')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('ac4ae06b48803a1734e457109f001193')
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
