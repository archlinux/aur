# Maintainer: kbipinkumar <kbipinkumar@pm.me>

pkgbase=kalign3
pkgname=('kalign3' 'python-kalign3')
pkgver=3.5.1
pkgrel=2
arch=('x86_64')
url="https://github.com/TimoLassmann/kalign"
license=('Apache-2.0')
makedepends=('cmake' 'gcc-libs' 'python-build' 'python-installer' 'python-wheel' 'python-scikit-build-core' 'pybind11' 'python-numpy' 'python-biopython')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/TimoLassmann/kalign/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('983bfd7da76010d59c3de3bae3d977cac78642c5eb061009dd12b11b9db5190d')

prepare() {
  cd "kalign-${pkgver}"
  # Remove cmake from build-system requirements for Python module
  sed -i '/"cmake>=3.18"/d' pyproject.toml

  # Fix kalignfmt installation and RPATH issue
  echo 'install(TARGETS kalignfmt DESTINATION bin)' >> src/CMakeLists.txt
}

build() {
  # 1. Build C tool and library
  cmake -B build -S "kalign-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_PYTHON_MODULE=OFF \
    -Wno-dev
  cmake --build build

  # 2. Build Python wheel
  cd "kalign-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  ctest --test-dir build --output-on-failure
}

package_kalign3() {
  pkgdesc="A fast and accurate multiple sequence alignment algorithm (v3)"
  depends=('glibc' 'gcc-libs' 'libgomp' 'libgcc')
  provides=("kalign")

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "kalign-${pkgver}/COPYING" -t "$pkgdir/usr/share/licenses/${pkgbase}/"
  install -Dm644 "kalign-${pkgver}/README.md" -t "$pkgdir/usr/share/doc/${pkgbase}/"
}

package_python-kalign3() {
  pkgdesc="Python wrapper for the Kalign multiple sequence alignment engine"
  depends=('python' 'python-numpy' 'gcc-libs' 'libgomp' 'libgcc' 'python-biopython')

  cd "kalign-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}/"
  install -Dm644 README-python.md -t "$pkgdir/usr/share/doc/${pkgname}/"
}
