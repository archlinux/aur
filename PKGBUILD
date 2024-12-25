# Maintainer: sukanka <su975853527 [at] gmail.com>
# Contributor: xantares <xantares09 [at] hotmail.com>
pkgbase=stanmath
pkgname=(stanmath stanmath-docs)
pkgver=5.0.0
pkgrel=1
pkgdesc="reverse-mode automatic differentiation library"
license=('BSD-3-Clause')
arch=('any')
makedepends=(make doxygen)
url="https://github.com/stan-dev/math"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver/_/-}.tar.gz")
sha256sums=('29c4baec9cb1be47204c104cffe6e185acdf247b0f77724af5f9f2f29c85c91a')
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
