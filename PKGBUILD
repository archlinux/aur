# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=ConfigFile
pkgname=haskell-configfile
pkgver=1.1.4
pkgrel=1
pkgdesc="Configuration file reading & writing"
url="http://software.complete.org/configfile"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-missingh')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('4455110c95172461b2d82ae88ba4f386d5e49ddd7f7def83714d2f6198090f0d121166eece3efa735341da9bbc0029e704be00d3e671d24ad27e838dfe913776')

build() {
    cd $_hkgname-$pkgver

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
            -f-buildtests
    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd $_hkgname-$pkgver

    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
    install -D -m644 "COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/COPYRIGHT"
}
