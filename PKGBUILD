# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pybind11_abseil
pkgname=${_base//_/-}
pkgdesc="Pybind11 bindings for the Abseil C++ Common Libraries"
pkgver=202402.0
pkgrel=2
arch=(any)
url="https://github.com/pybind/${_base}"
license=(BSD-3-Clause)
depends=(pybind11 abseil-cpp)
makedepends=(cmake python-virtualenv)
checkdepends=(python-numpy python-absl)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  numpy2.patch::${url}/commit/28db3c692de60a61fb8cdad665b21b1beb0c8859.patch)
sha512sums=('5a6a46a9ed9e62215e8f3682c2262f7922a199510ed45c355f02d10bab685b13e5d5946779ca2f2b588046bbe5d435164720517f4895427edb703e58a385ccbb'
  '62d555f003077ad2791083e3112861849c0f7dacc5ad3f8ff0673c891a3ded00e21a09367af5ea50d1ed278246b45c9017532e784028b334328df81d9bd258eb')

prepare() {
  # https://github.com/pybind/pybind11_abseil/pull/25
  cd ${_base}-${pkgver}
  patch -p1 -i ../numpy2.patch
}

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -Wno-dev

  cmake --build build --target all
}

check() {
  ctest --test-dir build
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm 644 ${_base}-${pkgver}/${_base}/__init__.py -t "${pkgdir}${site_packages}"/${_base}
  install -d -m755 "${pkgdir}/usr"/{include,lib}
  install -Dvm644 ${_base}-${pkgver}/${_base}/absl_casters.h -t "${pkgdir}/usr/include"
  install -Dvm755 build/${_base}/lib*.a -t "${pkgdir}/usr/lib"
  install -Dm 644 ${_base}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
