# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgbase=autodiff
pkgname=(${pkgbase} python-${pkgbase})
pkgver=1.0.3
pkgrel=1
pkgdesc="Automatic differentiation made easier for C++"
arch=(any)
url="https://github.com/${pkgbase}/${pkgbase}"
license=(MIT)
makedepends=(cmake eigen pybind11 python-build python-installer python-setuptools python-wheel)
# checkdepends=(catch2)
source=(${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b2ebfdf49f82a8543916395b54b0dbff3672cb0f69636d2ab8e9c887f53ceac645606bdbf2da56d7051176a88bd8e075ed6dad7f913975f89ac3f8a5f01d14d3')

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
