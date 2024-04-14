# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=fast_matrix_market
pkgdesc="Fast and full-featured Matrix Market I/O library"
pkgver=1.7.6
pkgrel=1
arch=(x86_64)
url="https://github.com/alugowski/${pkgname}"
license=(BSD-2-Clause)
depends=(python)
makedepends=(python-build python-installer pybind11 python-scikit-build-core cmake)
checkdepends=(armadillo benchmark blaze eigen gtest python-pytest
  python-threadpoolctl python-scipy suitesparse)
optdepends=('armadillo: for sparse and dense matrices support'
  'blaze: for sparse and dense matrices and vectors support'
  'eigen: for sparse and dense matrices and vectors support'
  'python-scipy: for scipy.io.mmread support'
  'python-threadpoolctl: for register support'
  'suitesparse: for GrB_Matrix and GrB_Vectors support')
# 'cxsparse: for C++ bindings support'
# 'dragonbox: for support'
# 'fastmatmr: for R bindings support'
# 'ryu: for support'
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e97da2daf76770502e862a13b7b61aaf8797d9bec9d33f182ff28c2a0b3f8e8b078b559643d980d6c7f3ff57da9cf52bde8807120b9373e61851fd57373d51aa')

prepare() {
  sed -i 's/include(..\/cmake\/GoogleTest.cmake)/#include(..\/cmake\/GoogleTest.cmake)/' ${pkgname}-${pkgver}/tests/CMakeLists.txt
  sed -i 's/include(..\/cmake\/Eigen.cmake)/#include(..\/cmake\/Eigen.cmake)/' ${pkgname}-${pkgver}/tests/CMakeLists.txt
  sed -i 's/include(..\/cmake\/Blaze.cmake)/#include(..\/cmake\/Blaze.cmake)/' ${pkgname}-${pkgver}/tests/CMakeLists.txt
  sed -i 's/include(..\/cmake\/GraphBLAS.cmake)/#include(..\/cmake\/GraphBLAS.cmake)/' ${pkgname}-${pkgver}/tests/CMakeLists.txt
  sed -i 's/include(..\/cmake\/GoogleBenchmark.cmake)/#include(..\/cmake\/GoogleBenchmark.cmake)/' ${pkgname}-${pkgver}/benchmark/CMakeLists.txt
  sed -i 's/FetchContent_GetProperties/#FetchContent_GetProperties/' ${pkgname}-${pkgver}/tests/CMakeLists.txt
  sed -i '30 a	find_package(GTest)' ${pkgname}-${pkgver}/tests/CMakeLists.txt
  sed -i '13 a	find_package(benchmark)' ${pkgname}-${pkgver}/benchmark/CMakeLists.txt
}

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=23 \
    -DFAST_MATRIX_MARKET_BENCH=ON \
    -DFAST_MATRIX_MARKET_TEST=ON \
    -DFMM_USE_DRAGONBOX=ON \
    -DFMM_USE_FAST_FLOAT=ON \
    -DFMM_USE_RYU=ON \
    -DFAST_MATRIX_MARKET_TEST_EXTERNAL_APPS=ON \
    -DFAST_MATRIX_MARKET_TEST_GRAPHBLAS=OFF \
    -DFAST_MATRIX_MARKET_TEST_COVERAGE=OFF \
    -Wno-dev
  cmake --build build --target all

  cd ${pkgname}-${pkgver}/python
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  ctest --verbose --output-on-failure --test-dir build
  cd ${pkgname}-${pkgver}/python
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not threadpoolctl'
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  # install headers
  install -d ${pkgdir}/usr/include
  mv ${pkgname}-${pkgver}/include/${pkgname} ${pkgdir}/usr/include
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd ${pkgname}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  rm -r ${pkgdir}/usr/include/{dragonbox-1.1.3,ryu}
  rm -r ${pkgdir}/usr/lib/{cmake,libdragonbox_to_chars.a,libryu.so}
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "${pkgdir}${site_packages}"/{include,lib}
}
