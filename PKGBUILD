# Maintainer: Jonathan Birk <jona@jbirk.de>

_hkgname=lambdabot-core
pkgname=haskell-lambdabot-core
pkgver=5.3.0.2
pkgrel=1
pkgdesc="lambdabot core functionality"
url="https://wiki.haskell.org/Lambdabot"
license=("custom")
arch=('x86_64')
depends=(
    'haskell-dependent-map'
    'haskell-dependent-sum-template'
    'haskell-edit-distance'
    'haskell-hslogger'
    'haskell-http'
    'haskell-lifted-base'
    'haskell-prim-uniq'
    'haskell-random-fu'
    'haskell-regex-tdfa'
    'haskell-safesemaphore'
    'haskell-split'
    'haskell-utf8-string'
    'haskell-zlib'
)
makedepends=('ghc')
checkdepends=()
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "0001-Support-GHC-9.patch")
sha512sums=('8e460ce42ad9b1394643ff740cb8b552e5baf8effb1dcf0acd36d0e9d1e8cf75fb43134305dd6bb316a454e92694d6eb6b730f016647c3f2253b07c14afafb78'
            '5a59d9150f931c09332f2126662b1277b848d02c605f25545c38da75e8cddb660dd7046913ec19886bc544ed5b104bf2b522c928ad1258ad16d2b359d25c8eb2')

prepare() {
    cd $_hkgname-$pkgver
    patch -p2 <../0001-Support-GHC-9.patch
}

build() {
    cd $_hkgname-$pkgver

    if (( CHECKFUNC )); then
        _opts=('--enable-tests')
    else
        _opts=('--disable-tests')
    fi

    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname "${_opts[@]}" \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid --ghc-option=-fllvm
    runhaskell Setup build $MAKEFLAGS
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
    cd $_hkgname-$pkgver
    runhaskell Setup test --show-details=direct
}

package() {
    cd $_hkgname-$pkgver

    install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
    install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
    runhaskell Setup copy --destdir="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -rf "$pkgdir"/usr/share/doc
}
