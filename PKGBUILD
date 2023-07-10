# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Based on pybind11, maintained by Daniel Bermond <dbermond@archlinux.org> and et.al.
pkgname=nanobind
pkgdesc="tiny and efficient C++/Python bindings"
pkgver=1.4.0
pkgrel=1
arch=(any)
url="https://${pkgname}.readthedocs.io"
license=('custom:BSD-3-clause')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel cmake eigen git)
checkdepends=(python-pytest python-scipy python-pytorch python-tensorflow python-jax)
source=(${pkgname}-${pkgver}::git+https://github.com/wjakob/${pkgname}.git#tag=v${pkgver}
  git+https://github.com/Tessil/robin-map.git)
sha512sums=('SKIP'
  'SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  git submodule init
  git config submodule.libs/ext/robin_map.url "${srcdir}/robin_map"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py clean --all
  python setup.py \
    build_ext \
    --include-dirs=/usr/include \
    --library-dirs=/usr/lib \
    --inplace
  python -m build --wheel --skip-dependency-check --no-isolation

  cmake \
    -S ${srcdir}/${pkgname}-${pkgver} \
    -B ${srcdir}/${pkgname}-${pkgver}/build \
    -DCMAKE_BUILD_TYPE=None \
    -G 'Unix Makefiles' \
    -DNB_TEST_STABLE_ABI=ON \
    -DNB_TEST_SHARED_BUILD="$(python -c 'import sys; print(int(sys.version_info.minor>=11))')" \
    -Wno-dev

  cmake --build build --target all

}

check() {
  cd ${pkgname}-${pkgver}/build
  python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  install -d -m755 "${pkgdir}/usr"/{include,lib/cmake}
  ln -s "../lib/python${_pyversion}/site-packages/nanobind/include/nanobind" "${pkgdir}/usr/include/nanobind"
  ln -s "../../lib/python${_pyversion}/site-packages/nanobind/cmake/" "${pkgdir}/usr/lib/cmake/nanobind"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
