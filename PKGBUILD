# Maintainer: William J. Bowman <aur@williamjbowman.com>

# custom variables
_hkgname=filemanip
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-filemanip
pkgver=0.3.6.3
pkgrel=2
pkgdesc="Expressive file and directory manipulation for Haskell."
url="http://hackage.haskell.org/package/filemanip"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc"
         "sh"
         "haskell-bytestring"
         "haskell-directory"
         "haskell-filepath"
         "haskell-mtl"
         "haskell-unix-compat")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('8836da17baaaf02ca080c9990ece4e0b0c8d6a128f458f8b64fd07b225ca9846')
sha512sums=('5cb6ad4e310c1ae3b038ccfa3154536db73145e4dea4a7be1ae0563ba44565494e378fa8e459f449feac2bcc140f1128b0b3ec915acd2300e73cf012ada85160')

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}

    runhaskell Setup configure -O \
      ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } \
      --enable-split-objs \
      --enable-shared \
      --prefix=/usr \
      --docdir=/usr/share/doc/${pkgname} \
      --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
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
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
