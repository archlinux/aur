# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sameer Puri <aur@purisa.me>
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>
_base=or-tools
pkgname=python-${_base}
pkgver=9.11
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/google/${_base}"
license=(Apache-2.0)
depends=(abseil-cpp python-absl python-numpy python-protobuf swig)
makedepends=(python-build python-installer python-setuptools python-wheel
    cmake git pybind11 python-pip)
# pybind11-abseil lsb-release python-mypy-protobuf python-virtualenv
optdepends=('cplex: CPLEX solver support'
    'python-pandas: used by some examples'
    'python-matplotlib: used by some examples')
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('f5fc5d9d4c72a6e73fddc1c198320744ea5386d11379aaa058a15c9f574795ae99ea8ebb74d21454a86616b6cadec9cfd33787ca0095eed0a2f4162495f1c63b')

build() {
    cmake \
        -S ${_base}-${pkgver} \
        -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DBUILD_CXX=OFF \
        -DBUILD_DOTNET=OFF \
        -DBUILD_JAVA=OFF \
        -DBUILD_PYTHON=ON \
        -DBUILD_SAMPLES=OFF \
        -DBUILD_CXX_EXAMPLES=OFF \
        -DUSE_COINOR=OFF \
        -DBUILD_CoinUtils=OFF \
        -DBUILD_Osi=OFF \
        -DUSE_CPLEX=OFF \
        -DBUILD_DEPS=ON
    # -DCPLEX_ROOT=/usr/lib/cplex
    cmake --build build --config Release --target all
}

package() {
    cd ${_base}-${pkgver}
    /usr/bin/pip --quiet install --root="$pkgdir" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(find -name 'ortools*whl')"
}
