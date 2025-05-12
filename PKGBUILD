# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: R. V. Lobato <rvlobato at pm dot me>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>
_base=cadabra
pkgname=${_base}2
pkgver=2.5.12
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
sha512sums=('fc6d0ae8c73760d9a17a5030713764157c44b39f8ec172bb78c02f27a8edde56473a923cc6f50b97e24aa52b43474f1b86aaaf959215b8b1fa6de995b7ba8b71')

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
