# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=bludigon
pkgver=0.1.1.0
pkgrel=1
pkgdesc="Configurable blue light filter"
url="https://github.com/jumper149/bludigon"
license=('custom:BSD3')
arch=('x86_64')
depends=(
  'ghc'
  'ghc-libs'
  'haskell-data-default'
  'haskell-finite-typelits'
  'haskell-lifted-base'
  'haskell-monad-control'
  'haskell-time-compat'
  'haskell-transformers-base'
  'haskell-x11'
  'libx11'
  'libxrandr'
)
source=(
  "https://github.com/jumper149/${pkgname}/archive/v${pkgver}.tar.gz"
  "compile-dynamically.patch"
  "Setup.hs"
)
sha256sums=(
  'ce75d074d6e074307c0e4488ee8cc10ce5accdf610539b7c6db48f47d54fb4bb'
  'acb3e75bd709d855e4715bc48250fe01163ded72ad42a094d80925e3854b8b83'
  '5066653559d4d6134b022d66a634a17fdcf8db35d28b447e581fec284afa4689'
)

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/compile-dynamically.patch"
  cp "${srcdir}/Setup.hs" "./"
}

build() {
  cd "${pkgname}-${pkgver}"

  runhaskell Setup configure -O \
    --disable-library-vanilla \
    --docdir="/usr/share/doc/${pkgname}" \
    --dynlibdir="/usr/lib" \
    --enable-executable-dynamic \
    --enable-shared \
    --enable-tests \
    --libsubdir=\$compiler/site-local/\$pkgid \
    --prefix="/usr" \
    #--datasubdir="${pkgname}" \
    #--ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    #--ghc-option='-pie' \

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd "${pkgname}-${pkgver}"

  runhaskell Setup test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m744 register.sh "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  runhaskell Setup copy --destdir="${pkgdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
