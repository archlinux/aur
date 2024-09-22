# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sameer Puri <aur@purisa.me>
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>
_base=or-tools
pkgname=python-${_base}
pkgver=9.11
pkgrel=3
pkgdesc="Google's Operations Research tools"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/google/${_base}"
license=(Apache-2.0)
depends=(abseil-cpp coin-or-cbc coin-or-clp eigen glpk re2 scip swig
  pybind11 python-absl python-mypy-protobuf python-numpy) # pybind11-abseil pybind11-protobuf
makedepends=(cmake git python-build python-installer python-setuptools python-wheel python-virtualenv)
# checkdepends(gtest)
optdepends=('cplex: CPLEX solver support'
  'python-matplotlib: used by some examples'
  'python-pandas: used by some examples')
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('f5fc5d9d4c72a6e73fddc1c198320744ea5386d11379aaa058a15c9f574795ae99ea8ebb74d21454a86616b6cadec9cfd33787ca0095eed0a2f4162495f1c63b')

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DBUILD_CXX=ON \
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
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" "$(find -name 'ortools*whl')"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
