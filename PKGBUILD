# Maintainer: j605
pkgname=haskell-pdfinfo
_pkgname=pdfinfo
pkgver=1.5.4
pkgrel=1
pkgdesc='Just a wrapper around the pdfinfo command'
url='https://github.com/chrisdone/pdfinfo'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs'
         'haskell-process-extras'
         'haskell-old-locale'
         'haskell-time-locale-compat')
makedepends=('ghc')
source=("https://hackage.haskell.org/package/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('37a6c2b8a5b873124e747a3058931d7538f061671b267c9d29837316425b9ef04a5d6ac6fabd7b07b28b634f9db890f84434bda523821cb973a560266e462d56')

build() {
    cd $_pkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir="/usr/share/doc/${pkgbase}" --datasubdir="$pkgname" --enable-tests \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
            -f-trypandoc -f-embed_data_files -f-static
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd $_pkgname-$pkgver
    install -Dm744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -Dm744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    install -Dm644 LICENSE       "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    runhaskell Setup copy --destdir="${pkgdir}"
}
