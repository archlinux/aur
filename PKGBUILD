# Maintainer: j605

pkgname=paperboy
_pkgname=pboy
pkgver=1.3
pkgrel=1
pkgdesc='A small .pdf management utility'
url='https://github.com/2mol/pboy'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs'
         'haskell-brick'
         'haskell-config-ini'
         'haskell-either'
         'haskell-microlens'
         'haskell-microlens-th'
         'haskell-path'
         'haskell-path-io'
         'haskell-pdfinfo'
         'haskell-titlecase'
         'haskell-vector'
         'haskell-vty')
makedepends=('ghc')
source=($pkgname-$pkgver.tar.gz::"https://github.com/2mol/pboy/archive/$pkgver.tar.gz")
sha512sums=('cb49e84976bbb971238c8932e1c143ab533633109f4a4027137e9a32b0c19edd45073f3b9f9a6f2c63c30b3056cbf0c7db504ef80bd4a10cff430b422ad7770e')

prepare() {
    cd $_pkgname-$pkgver
    cat <<EOF > Setup.hs
    import Distribution.Simple
    main = defaultMain
EOF
}

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
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
    install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
    runhaskell Setup copy --destdir="${pkgdir}"
}
