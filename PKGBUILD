# Maintainer: Leif Warner <abimlech@gmail.com>
_hkgname=aosd
pkgname=haskell-aosd
pkgver=0.2.1
pkgrel=1
pkgdesc="Bindings to libaosd, a library for Cairo-based on-screen displays"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-x11' 'haskell-bindings-dsl>=1.0.11' 'haskell-cairo>=0.12' 'haskell-colour' 'haskell-monad-control' 'haskell-pango>=0.12' 'haskell-transformers' 'libaosd')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz haskell-aosd.patch)
install=${pkgname}.install
md5sums=('fc63d1e99278a7807225feab46c22900'
         '7f3e8aaa61345b80d148105759cbe2c8')
prepare() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    patch -p1 -i $srcdir/haskell-aosd.patch 
}
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
