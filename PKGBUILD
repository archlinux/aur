# Maintainer: Zihao Wang <dev@wzhd.org>

pkgname=propellor
pkgver=3.3.0
pkgrel=1
pkgdesc="property-based host configuration management in haskell"
url="https://propellor.branchable.com/"
license=("custom:BSD2")
arch=('i686' 'x86_64')
depends=("cabal-install" "ghc=8.0.1" "git" "gnupg" "gmp" "libffi"
         "haskell-async" "haskell-missingh" "haskell-hslogger" "haskell-unix-compat"
         "haskell-ansi-terminal" "haskell-hackage-security" "haskell-ifelse" "haskell-network"
         "haskell-mtl" "haskell-transformers-base" "haskell-exceptions" "haskell-stm"
         "haskell-text")
source=("git+https://github.com/joeyh/propellor.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd propellor

  runhaskell Setup configure -O --prefix=/usr --docdir="/usr/share/doc/$pkgname" \
             --libsubdir=\$compiler/site-local/\$pkgid \
             --enable-library-profiling --enable-shared
  runhaskell Setup build
  runhaskell Setup haddock --hoogle --html
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd propellor

  install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
  ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"

  runhaskell Setup copy --destdir="$pkgdir"

  rm -f "${pkgdir}/usr/bin/propellor-config"

  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
