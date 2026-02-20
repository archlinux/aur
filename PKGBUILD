# Maintainer: sukanka <su975853527 [at] gmail.com>
# Contributor: xantares <xantares09 [at] hotmail.com>
pkgbase=stanmath
pkgname=(stanmath stanmath-docs)
pkgver=5.2.0
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD-3-Clause')
arch=('any')
makedepends=(make doxygen patch)
url="https://github.com/stan-dev/math"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver/_/-}.tar.gz"
  "fix-typo.patch::https://github.com/sukanka/math/commit/225deaaba1d.patch"
)
sha256sums=('ac34cfab03ea221a757cbc8371fbb24525ed60ee1c8570d73a9255317222df2b'
  '30f55c77490ed99b454714678e2284e2c5e474271ae66391487b62ec7d8c89c1')
options=(!strip)

_apply_patch() {
  cd math-${pkgver/_/-}
  patch -p1 <../fix-typo.patch
}
prepare() {
  (
    _apply_patch
  )
  cd math-${pkgver/_/-}/stan/math/rev/functor
  sed -i kinsol_data.hpp \
    -e "s|sundials_context.h>|sundials_context.hpp>|"
  sed -i cvodes_integrator{,_adjoint}.hpp \
    -e "s|realtype|sunrealtype|g"
  sed -i idas_service.hpp \
    -e "s|RCONST|SUN_RCONST|g"
}

build() {
  cd math-${pkgver/_/-}
  make doxygen
}

package_stanmath() {
  cd math-${pkgver/_/-}

  install -d "$pkgdir"/usr/include
  cp -r stan "$pkgdir"/usr/include
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/stanmath/

}

package_stanmath-docs() {
  pkgdesc+=" (documentation)"

  cd math-${pkgver/_/-}
  install -d "$pkgdir"/usr/share/doc/stan
  cp -r doc "$pkgdir"/usr/share/doc/stan/math
}
