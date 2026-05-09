# Maintainer: Olivia Mackintosh <livvy@base.nu>
_hkgname=cache
pkgname=haskell-cache-git
pkgver=0.1.3.0
pkgrel=1
pkgdesc="An in-memory key/value store with expiration support, similar to patrickmn/go-cache for Go."
provides=(haskell-cache)
url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD-3-Clause')
arch=('i686' 'x86_64')
depends=('ghc-libs' 'haskell-base' 'haskell-clock' 'haskell-hashable' 'haskell-stm' 'haskell-transformers' 'haskell-unordered-containers')
makedepends=('ghc')
source=("${pkgname}::git+https://github.com/livmackintosh/haskell-cache")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir="/usr/share/doc/${pkgname}" --datasubdir="$pkgname" \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "${pkgname}"
  install -D -m744 register.sh "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/${pkgname}/html "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
  runhaskell Setup copy --destdir="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
