# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgbase=autodiff
pkgname=(${pkgbase} python-${pkgbase})
pkgver=1.1.2
pkgrel=1
pkgdesc="Automatic differentiation made easier for C++"
arch=(any)
url="https://github.com/${pkgbase}/${pkgbase}"
license=(MIT)
depends=()
makedepends=(cmake eigen pybind11 python-build python-installer python-setuptools python-wheel)
# checkdepends=(catch2)
source=(${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a8f3c3126fc8fb9502384eaf6cb416bfb24dede83edc70a8333c9e2824fefcb4221da71d2f0b30b52dcbe86042cb79a9dd1d93249bfdb052af71c0c1c63c819e')

prepare() {
  # https://github.com/autodiff/autodiff/issues/305#issuecomment-2028248898
  sed -i 's/PYTHON_EXECUTABLE/Python_EXECUTABLE/' ${pkgbase}-${pkgver}/python/package/CMakeLists.txt
}

build() {
  cmake \
    -S ${pkgbase}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_CXX_STANDARD=17 \
    -DAUTODIFF_BUILD_DOCS=OFF \
    -DAUTODIFF_BUILD_EXAMPLES=OFF \
    -DAUTODIFF_BUILD_PYTHON=ON \
    -DAUTODIFF_BUILD_TESTS=OFF
  cmake --build build

  cd build/python/package
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   ctest --test-dir build
# }

package_autodiff() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgbase}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-autodiff() {
  depends=(python)
  arch=(x86_64)
  pkgdesc+=" (python bindings)"

  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" build/python/package/dist/*.whl
  install -Dm 644 ${pkgbase}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
