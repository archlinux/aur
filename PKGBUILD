# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Martin Harvan <martinhrvn@gmail.com>

_hkgname=unordered-containers
pkgname=haskell-unordered-containers
pkgver=0.2.5.1
pkgrel=1
pkgdesc="Efficient hashing-based container types"
url="https://github.com/tibbe/unordered-containers"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-deepseq>=1.1' 'haskell-hashable>=1.0.1.1')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('c330100ca1d5e6b3cb8242d0bde706f9')

build() {
  cd ${srcdir}/${_hkgname}-${pkgver}
  runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
    --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register   --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd ${srcdir}/${_hkgname}-${pkgver}
  install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
  install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
  install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
  ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
  runhaskell Setup copy --destdir=${pkgdir}
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
