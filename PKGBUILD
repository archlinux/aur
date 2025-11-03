# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="optim"
pkgname=(
  "${pkgbase}-common"
  "${pkgbase}-armadillo"
  "${pkgbase}-eigen"
)
_commit="f9d9357169ce4b497a677faa9ce85e901e77275d" # 3.1.3
pkgver=3.1.3
pkgrel=1
pkgdesc="Lightweight C++ library of numerical optimization methods for nonlinear functions"
arch=('x86_64')
url="https://optimlib.readthedocs.io/"
_url="https://github.com/kthohr/${pkgbase}"
license=('Apache-2.0')
makedepends=(
  'armadillo'
  'basematrixops'
  'blas'
  'eigen>=3.4.0'
  'gcc-libs'
  'glibc'
  'lapack'
)
_pkgsrc="${_url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('3809f753fc75c007c55ee995264c72487415a22dacc0846ba8ac0c1d1c24b91a')

prepare() {
  cd "${srcdir}"
  find "${_pkgsrc}" -type f -exec \
    sed -i 's|BaseMatrixOps/include|BaseMatrixOps|g' "{}" +
  rm -rf "${_pkgsrc}/include/BaseMatrixOps"

  cp -a "${_pkgsrc}" "${_pkgsrc}-armadillo"
  cp -a "${_pkgsrc}" "${_pkgsrc}-eigen"
}

build() {
  export EIGEN_INCLUDE_PATH='/usr/include/eigen3'
  local configure_options=(
    -i "/usr"
    -o "${CXXFLAGS} ${LDFLAGS}"
    -p
  )

  cd "${srcdir}/${_pkgsrc}-armadillo"
  ./configure "${configure_options[@]}" -l "arma"
  make "CXX_STD=-std=c++14"

  cd "${srcdir}/${_pkgsrc}-eigen"
  ./configure "${configure_options[@]}" -l "eigen"
  make
}

_package_common() {
  cd "${srcdir}/${_pkgsrc}-${1}"
  sed -i "s|^INSTALL_PATH=.*|INSTALL_PATH=${pkgdir}/usr|g" 'Makefile'
  install -vd "${pkgdir}/usr/lib"
  make install
}

package_optim-common() {
  pkgdesc+=" (common files)"
  arch=('any')

  _package_common "armadillo"
  rm -rf "${pkgdir}/usr/lib"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_optim-armadillo() {
  pkgdesc+=" (${pkgname#"${pkgbase}-"} wrapper)"
  depends=(
    "${pkgbase}-common>=${pkgver}-${pkgrel}"
    'armadillo'
    'blas'
    'gcc-libs'
    'glibc'
    'lapack'
  )
  provides=(
    "${pkgbase}"
  )
  conflicts=(
    "${pkgbase}"
  )

  _package_common "${pkgname#"${pkgbase}-"}"
  rm -rf "${pkgdir}/usr/include"
}

package_optim-eigen() {
  pkgdesc+=" (${pkgname#"${pkgbase}-"} wrapper)"
  depends=(
    "${pkgbase}-common>=${pkgver}-${pkgrel}"
    'eigen>=3.4.0'
    'gcc-libs'
    'glibc'
  )
  provides=(
    "${pkgbase}"
  )
  conflicts=(
    "${pkgbase}"
  )

  _package_common "${pkgname#"${pkgbase}-"}"
  rm -rf "${pkgdir}/usr/include"
}
