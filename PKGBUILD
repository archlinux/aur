# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_hkgname=string-conversions
pkgname=haskell-string-conversions
pkgver=0.4.0.1
pkgrel=2
pkgdesc="Simplifies dealing with different types for strings"
url="https://github.com/soenkehahn/string-conversions"
license=("custom:BSD3")
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-text' 'haskell-utf8-string')
options=('strip' 'staticlibs')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('46bcce6d9ce62c558b7658a75d9c6a62f7259d6b0473d011d8078234ad6a1994')

build() {
  cd "${_hkgname}-${pkgver}"

  runhaskell Setup configure -O -p --enable-split-objs --enable-shared --prefix=/usr \
    --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register   --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "${_hkgname}-${pkgver}"

  install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
  ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
  runhaskell Setup copy --destdir=${pkgdir}
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
