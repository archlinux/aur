# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=sophus
_pkgname=Sophus
pkgver=1.24.6
pkgrel=4
pkgdesc="C++ implementation of Lie Groups using Eigen"
arch=('x86_64')
url="https://github.com/strasdat/Sophus"
license=('MIT')
depends=('eigen' 'fmt')
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('ceres-solver' 'python-pytest')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/strasdat/Sophus/archive/${pkgver}.tar.gz")
sha256sums=('3f3098bdac2c74d42a921dbfb0e5e4b23601739e35a1c1236c2807c399da960c')

prepare() {
  cd $_pkgname-$pkgver
  sed -i "s|-Werror|-Wno-error|g" CMakeLists.txt
}

build() {
  cd $_pkgname-$pkgver
  cmake -B build -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SOPHUS_TESTS=ON \
        -Wno-dev
  cmake --build build
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  ctest --test-dir build --output-on-failure
  python -m venv venv --system-site-packages
  source venv/bin/activate
  python -m pip install sympy==1.8 --ignore-installed
  python -m installer dist/*.whl
  pushd sympy
  sh run_tests.sh
  popd
  python -m pytest sophus_pybind/tests/sophusPybindTests.py
  deactivate
}

package() {
  cd $_pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
