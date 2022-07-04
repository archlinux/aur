# Maintainer: Max <max@swk-web.com>
# Contributor: j605

pkgname=paperboy
_pkgname=pboy
pkgver=1.7.1
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
makedepends=('ghc'
             'haskell-titlecase')
source=($pkgname-$pkgver.tar.gz::"https://github.com/2mol/pboy/archive/$pkgver.tar.gz")
sha512sums=('7ec51a957ad0ed0678b0e2b00b7e39cd47d60f5bc7f516e23f7e1684d8d9fa72724daee5734e24becdbd0a25c838664ee6890a5b541febeed3d7fbb833bf9219')

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
