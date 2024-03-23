# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgbase=autodiff
pkgname=(${pkgbase} python-${pkgbase})
pkgver=1.1.0
pkgrel=1
pkgdesc="Automatic differentiation made easier for C++"
arch=(any)
url="https://github.com/${pkgbase}/${pkgbase}"
license=(MIT)
depends=()
makedepends=(cmake eigen pybind11 python-build python-installer python-setuptools python-wheel)
# checkdepends=(catch2)
source=(${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9209cc16383a87b1e86372d48a9f2ddd945f1f54c6ebd62b7eba0fa191a2dab359a2331d2a42cd4367eec97dc97db0c7374818f04d0bb8b20e20eb96c87bd251')

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
