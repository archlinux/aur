# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_hkgname=servant
pkgname=haskell-servant
pkgver=0.11
pkgrel=1
pkgdesc="A family of combinators for defining webservices APIs"
url="https://haskell-servant.readthedocs.io"
license=("custom:BSD3")
arch=('i686' 'x86_64')
depends=('ghc'
         'haskell-aeson'
         'haskell-attoparsec'
         'haskell-base-compat'
         'haskell-case-insensitive'
         'haskell-http-api-data'
         'haskell-http-media'
         'haskell-http-types'
         'haskell-mmorph'
         'haskell-mtl'
         'haskell-natural-transformation'
         'haskell-network-uri'
         'haskell-string-conversions'
         'haskell-text'
         'haskell-vault')
options=('strip' 'staticlibs')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('c5b3f7af140fdafd3f646dcea6720c1b3b8a376f1f19a020b200acde64846b03')

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
