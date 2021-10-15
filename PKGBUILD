# Maintainer: j605

pkgname=paperboy
_pkgname=pboy
pkgver=1.7
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
sha512sums=('0e8cdc2f8bc790f59cc10b7eb8020b352e73de1e36137f6dd99075a8abf8958e844129bf6f12169637d56e65f8789ad850c35f9c0836c10b79a5cf46a526844b')

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
