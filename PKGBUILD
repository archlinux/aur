# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Austin Robinson <austin.rbsn@gmail.com>

_hspkgname=OpenGLRaw
pkgname=haskell-openglraw
pkgver=3.2.4.0
pkgrel=1
pkgdesc="A raw binding for the OpenGL graphics system"
url="http://hackage.haskell.org/package/${_hspkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc'
         'libgl'
         'haskell-text'
         'haskell-half'
         'haskell-fixed'
         'haskell-base-compat'
         'haskell-transformers-base'
         'haskell-bytestring-builder')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hspkgname}/${pkgver}/${_hspkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('54553e989777d336c9ae97a45d273701')

build() {
    cd "${srcdir}"/${_hspkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd "${srcdir}"/${_hspkgname}-${pkgver}
    install -D -m744 register.sh   "${pkgdir}"/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh "${pkgdir}"/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 "${pkgdir}"/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hspkgname}
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    rm -f "${pkgdir}"/usr/share/doc/${pkgname}/LICENSE
}
