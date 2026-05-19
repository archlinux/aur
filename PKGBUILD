# Maintainer: sukanka <su975853527 [at] gmail.com>
# Contributor: xantares <xantares09 [at] hotmail.com>
pkgbase=stanmath
pkgname=(stanmath stanmath-docs)
pkgver=5.3.0
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD-3-Clause')
arch=('any')
makedepends=(make doxygen patch)
url="https://github.com/stan-dev/math"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver/_/-}.tar.gz"
)
sha256sums=('6ad05c37e7df8add7d0089489249ddaadb57e30cead8cdd1323f4e1283c4fe64')
options=(!strip)
prepare() {

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
