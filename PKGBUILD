# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: R. V. Lobato <rvlobato at pm dot me>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>
_base=cadabra
pkgname=${_base}2
pkgver=2.5.4
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
sha512sums=('ddd8a04c272163a40bc7bcca35ba6b9e4d66c95752ac2218edf7f07ab868414061030755bcfa67676e7e2651c2495c9987e8db351f9082b7c3c1e4e0bddfe8fc')

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
