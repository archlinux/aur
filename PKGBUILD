# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=purescript
pkgver=0.8.5.0
pkgrel=1
pkgdesc="PureScript Programming Language Compiler"
url="http://www.purescript.org"
license=('custom:MIT')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-glob<0.8' 'haskell-aeson<0.12' 'haskell-aeson-better-errors>=0.8' 'haskell-ansi-wl-pprint' 'haskell-base-compat>=0.6.0' 'haskell-bower-json>=0.7' 'haskell-boxes<0.2.0' 'haskell-bytestring' 'haskell-containers' 'haskell-directory' 'haskell-dlist' 'haskell-filepath' 'haskell-haskeline>=0.7.0.0' 'haskell-language-javascript' 'haskell-lifted-base<0.2.4' 'haskell-monad-control<1.1' 'haskell-mtl' 'haskell-optparse-applicative>=0.10.0' 'haskell-parallel' 'haskell-parsec' 'haskell-pattern-arrows<0.1' 'haskell-process' 'haskell-safe<0.4' 'haskell-semigroups<0.19' 'haskell-split' 'haskell-syb' 'haskell-text' 'haskell-time' 'haskell-transformers' 'haskell-transformers-base<0.5' 'haskell-transformers-compat>=0.3.0' 'haskell-unordered-containers' 'haskell-utf8-string<2' 'haskell-vector' 'haskell-pipes-http')
depends=('gmp')
source=(http://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('2be70b8e63da83f8d03e15ca3fdfb856')
build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${pkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
