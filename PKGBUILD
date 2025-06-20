# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sameer Puri <aur@purisa.me>
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>
_base=or-tools
pkgname=python-${_base}
pkgver=9.14
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/google/${_base}"
license=(Apache-2.0)
depends=(abseil-cpp coin-or-cbc coin-or-clp eigen glpk re2 scip swig
  pybind11 python-absl python-mypy-protobuf python-numpy) # pybind11-abseil pybind11-protobuf
makedepends=(cmake benchmark git python-installer python-setuptools python-wheel python-virtualenv)
# checkdepends(gtest)
optdepends=('cplex: CPLEX solver support'
  'python-matplotlib: used by some examples'
  'python-pandas: used by some examples')
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  pybind11_protobuf.patch)
b2sums=('c7b234c0e8f56640ddf99efb62e12034fb6826ec176ecbfce596cc79036d6048a65800edc8bddc5f85515aa1f6f55804e4d59f912904354240ece3ee8154630f'
        '0d097b8e13ec5b9143c4195a5fe4d331a60bfe9fb3f82762c89a7769f356ccb34b5a4a371baf3eabb1232b87a9f31e294794547983b18513103a5cb0684c399b')

prepare() {
  # https://github.com/google/or-tools/issues/4380#issuecomment-2394980250
  cp pybind11_protobuf.patch ${_base}-${pkgver}/patches
}

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_CXX=ON \
    -DCMAKE_CXX_FLAGS="-Wno-format-security" \
    -DBUILD_CXX_EXAMPLES=OFF \
    -DBUILD_CXX_SAMPLES=OFF \
    -DBUILD_DOTNET=OFF \
    -DBUILD_JAVA=OFF \
    -DBUILD_PYTHON=ON \
    -DBUILD_SAMPLES=OFF \
    -DBUILD_DEPS=OFF \
    -DUSE_COINOR=OFF \
    -DBUILD_pybind11_abseil=ON \
    -DBUILD_pybind11_protobuf=ON \
    -DUSE_CPLEX=OFF \
    -DUSE_COINOR=ON \
    -DUSE_GLPK=ON \
    -DUSE_HIGHS=OFF \
    -DUSE_SCIP=ON \
    -DUSE_SYSTEM_ABSEIL=ON \
    -DUSE_SYSTEM_PROTOBUF=ON \
    -DUSE_SYSTEM_PYBIND=ON \
    -DVENV_USE_SYSTEM_SITE_PACKAGES=ON \
    -Wno-dev
  # -DCPLEX_ROOT=/usr/lib/cplex
  cmake --build build --config Release --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" build/python/dist/*.whl
  install -Dm 644 ${_base}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r ${pkgdir}${site_packages}/pybind11_abseil
  rm -r "${pkgdir}"/usr/share/minizinc
  rm -r "${pkgdir}"/usr/share/doc/
}
