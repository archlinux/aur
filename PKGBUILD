# $Id$
# Maintainer: Emanuel Couto <unit73e at gmail dot com>

_hkgname=helm
pkgname=haskell-helm-git
pkgver=r283.e2d8745
pkgrel=1
pkgdesc="A functionally reactive game engine"
url="http://github.com/switchface/helm"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-cairo' 'haskell-elerea' 'haskell-linear' 'haskell-mtl'
         'haskell-pango' 'haskell-random' 'haskell-sdl2' 'haskell-stm' 'haskell-text')
makedepends=('ghc')
conflicts=('haskell-helm')
provides=('haskell-helm')
source=("${pkgname}::git+https://github.com/z0w0/helm.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${pkgname}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
