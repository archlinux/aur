# Maintainer: corvus_192 <rua at jendrik dot eu>
# Contributor: Fabian Beuke <mail@beuke.org>

_hkgname=pointfree
pkgname=haskell-pointfree
pkgver=1.1.1.11
pkgrel=1
pkgdesc="Tool for refactoring expressions into pointfree form"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:OtherLicense')
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('gmp' 'ghc' 'ghc-libs' 'haskell-src-exts')
checkdepends=('haskell-hunit' 'haskell-quickcheck')
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
md5sums=('88eb005b3c15d95a554786e0eac9f9a0')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}" || exit 1
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
        --ghc-option='-pie' --enable-tests
    runhaskell Setup build -v $MAKEFLAGS
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
    cd "${srcdir}/${_hkgname}-${pkgver}" || exit 1
    runhaskell Setup test
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}" || exit 1

    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
