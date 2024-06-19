# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: R. V. Lobato <rvlobato at pm dot me>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>
_base=cadabra
pkgname=${_base}2
pkgver=2.5.2
pkgrel=1
pkgdesc="A field-theory motivated approach to computer algebra"
arch=(x86_64)
url="https://${_base}.science"
license=(GPL-3.0-or-later)
conflicts=(${pkgname}-git)
depends=(boost-libs glibmm gmp gtkmm3 jsoncpp python-gmpy2 jupyterlab python-matplotlib
  python-sympy sqlite texlive-latexextra texlive-mathscience)
makedepends=(boost cmake) # system-wide pybind11 is not used, instead bundled yes.
optdepends=('mathjax: Doxygen documentation'
  'doxygen: Doxygen documentation')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kpeeters/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('598b9e9591326ada5948f2b5786686a4318811f55e2a888dcd8efb54281e4db53617806203e6642084a1ab888317d90b17e139c25a323dc73da38041040f7fae')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DENABLE_FRONTEND=ON \
    -DENABLE_JUPYTER=OFF \
    -DENABLE_MATHEMATICA=OFF \
    -DENABLE_PY_JUPYTER=ON \
    -DENABLE_SYSTEM_JSONCPP=ON \
    -DUSE_PYTHON_3=ON \
    -Wno-dev
  cmake --build build --target all
}

# check() {
#   ctest --verbose --output-on-failure --test-dir build
# }

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
