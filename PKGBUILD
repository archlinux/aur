# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=blucontrol
pkgver=0.2.1.0
pkgrel=1
pkgdesc="Configurable blue light filter"
url="https://github.com/jumper149/${pkgname}"
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
  "${url}/archive/v${pkgver}.tar.gz"
  "compile-dynamically.patch"
  "Setup.hs"
)
sha256sums=(
  '131632f6a952cb8325726c368a8fedd670aa7e0c9ce57b4cc7dc00270a4e6f39'
  '5f535fb64bf4da30547721608039eab4a399547a752dbf405baff36f0c9f6286'
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
