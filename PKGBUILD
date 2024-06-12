# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=sophus
_pkgname=Sophus
pkgver=1.24.06
pkgrel=1
pkgdesc="C++ implementation of Lie Groups using Eigen"
arch=('x86_64' 'i686')
url="https://strasdat.github.io/Sophus/latest"
license=('MIT')
depends=('eigen' 'fmt')
makedepends=('cmake')
checkdepends=('ceres-solver' 'python-pytest')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/strasdat/Sophus/archive/${pkgver}.tar.gz")
sha256sums=('fec59daf55c62b7f9aaaddb13ab352f0ba755acb0bede36577eb68e616dc8c0f')

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
  python -m installer dist/*.whl
  python -m pytest sophus_pybind/tests/sophusPybindTests.py
  deactivate
}

package() {
  cd $_pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
