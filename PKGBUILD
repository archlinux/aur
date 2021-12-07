# Maintainer: Tharre <tharre3@gmail.com>

pkgname=pandoc-pyplot
pkgver=2.3.0.1
pkgrel=2
pkgdesc='A Pandoc filter to generate Matplotlib figures directly in documents'
url='https://github.com/LaurentRDC/pandoc-pyplot'
license=('GPL')
arch=('x86_64')
depends=('ghc-libs' 'pandoc' 'haskell-hspec' 'haskell-tasty'
         'haskell-tasty-hunit' 'haskell-tasty-hspec' 'haskell-shakespeare'
         'haskell-yaml' 'haskell-open-browser' 'haskell-typed-process'
         'python-matplotlib' 'python-pillow')
makedepends=('ghc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LaurentRDC/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5cb424df18b4151472c02ccb35360392bf800a1aa5d650dec1fdbab68a93101e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgbase}" --datasubdir="$pkgname" --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
            -f-embed_data_files -f-static
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    LC_CTYPE=en_US.UTF-8 runhaskell Setup test
}

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/COPYING.md"
}
