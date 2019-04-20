# Maintainer: j605

pkgname=paperboy
_pkgname=pboy
pkgver=1.1
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
source=($pkgname-$pkgver.tar.gz::"https://github.com/2mol/pboy/archive/1.1.tar.gz")
sha512sums=('d94768d0244c93eaba831338859cbfc671eec88d8e1dde7a38587c15ff77c7898043abcf449a7db73d0efbcb6c630a17587706fa9b87f4c24b9d44425383c939')

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
