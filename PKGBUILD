# Maintainer: Darkstalker Kaathe <primordial dot serpent dot darkstalker dot kaathe at proton dot me>

pkgname=nixfmt
pkgver=1.5.0
pkgrel=2
pkgdesc="The official formatter for Nix code"
url="https://github.com/NixOS/nixfmt"
license=("MPL-2.0")
arch=("x86_64")
options=('!debug')
depends=("ghc-libs" "haskell-cmdargs" "haskell-file-embed" "haskell-megaparsec"
    "haskell-parser-combinators" "haskell-pretty-simple"
    "haskell-safe-exceptions" "haskell-scientific")
makedepends=("ghc" "uusi")
checkdepends=("shellcheck")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=("524b10c7ba2ec9d6701370100d123e917d68f27a05e8d802030cfb5d5a205ba9aa3a070aaed863a76d4af0342a4d1d74c0aa4bbdf4f6e09bd3ea4128bd08ecbc")

prepare() {
    cd ${pkgname}-${pkgver}

    # GHC 9.6 doesn"t know about GHC2024 (remove when `ghc` gets updated)
    sed -i "s/GHC2024/GHC2021/" $pkgname.cabal

    uusi --all ${pkgname}.cabal
}

build() {
    cd ${pkgname}-${pkgver}

    gen-setup
    runhaskell Setup configure -O \
        --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/licenses/${pkgname} --flags=-werror \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
        --ghc-option=-XLambdaCase \
        --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
        --ghc-option=-pie

    runhaskell Setup build
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script

    sed -i -r -e "s|ghc-pkg.*update[^ ]* |&"--force" |" register.sh
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&"--force" |" unregister.sh
}

check() {
    cd ${pkgname}-${pkgver}
    LD_LIBRARY_PATH="$PWD/dist/build" PATH="$PWD/dist/build/$pkgname:$PATH" \
        test/test.sh
}

package() {
    cd ${pkgname}-${pkgver}

    install -Dm744 register.sh \
        "${pkgdir}"/usr/share/haskell/register/${pkgname}.sh
    install -Dm744 unregister.sh \
        "${pkgdir}"/usr/share/haskell/unregister/${pkgname}.sh

    runhaskell Setup copy --destdir="${pkgdir}"
}
