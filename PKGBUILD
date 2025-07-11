# Maintainer: MajorX234 <majorx234 at gmail dot com>

_hkgname=repa
pkgname=haskell-repa
pkgver=3.4.2.0
pkgrel=1
pkgdesc="haskell repa provides high performance, regular, multi-dimensional, shape polymorphic parallel arrays"
url="http://repa.ouroborus.net/"
license=('BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-quickcheck' 'haskell-vector')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('6e9e5ac7c7cc38fea0290c00cbb389ef390f712e580edc29b5db025f32ea6be1a76d79bfd13eaf81618e79b1f5c6d42e2e70f8c454bfd69520578cc33e47c0fd')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
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
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
