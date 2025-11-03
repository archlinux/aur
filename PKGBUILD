# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="BaseMatrixOps"
pkgname="${_Name,,}"
_commit="9e5beec15d803f0429dadae5e9218ef907271383" # r40
pkgver="r40+g${_commit::7}"
pkgrel=2
pkgdesc="Wrappers to C++ linear algebra libraries"
arch=('any')
url="https://github.com/kthohr/${_Name}"
license=('Apache-2.0')
checkdepends=(
  'armadillo'
  'eigen'
)
optdepends=(
  'armadillo: supported linear algebra library'
  'eigen: supported linear algebra library'
)
_pkgsrc="${url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('974f3f89e9c93ebfb54f5f680323b880c248e1d9a9c505213ee4fa951202f108')

check() {
  cd "${srcdir}/${_pkgsrc}"
  cp -a "tests" "tests-arma"
  cp -a "tests" "tests-eigen"

  cd "${srcdir}/${_pkgsrc}/tests-arma"
  make \
    BMO_ENABLE_ARMA_WRAPPERS="y" \
    ARMA_INCLUDE_PATH="/usr/include" \
    BMO_CXX_STD="-std=c++14"
  ./run_tests

  cd "${srcdir}/${_pkgsrc}/tests-eigen"
  make \
    BMO_ENABLE_EIGEN_WRAPPERS="y" \
    EIGEN_INCLUDE_PATH="/usr/include/eigen3"
  ./run_tests
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/include/${_Name}"
  cp -vaT --no-preserve=ownership "include" "${pkgdir}/usr/include/${_Name}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
