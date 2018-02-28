_hkgname=iwlib
pkgname=haskell-iwlib-git
pkgver=0.1.0+5+gf8a41bd
pkgrel=1
pkgdesc='A thin wrapper over the iw C library, providing access to wireless card information in supported systems.'
url='https://hackage.haskell.org/package/iwlib'
arch=('i686' 'x86_64')
license=('custom:BSD3')
depends=('wireless_tools' 'ghc-libs')
makedepends=('git' 'ghc')
source=("${pkgname}::git+https://github.com/jaor/${_hkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --always|sed 's|-|+|g'|sed -r 's|v(.+)|\1|'
}

build() {
    cd "${srcdir}/${pkgname}"
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
        -f-developer -f-integer-simple
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
