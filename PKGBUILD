# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-laszip
pkgdesc='Python bindings for the LASzip compression library'
pkgver=0.2.4
pkgrel=2
url='https://github.com/tmontaigu/laszip-python'
license=('MIT')
arch=('x86_64')

depends=(
  'gcc-libs'
  'glibc'
  'laszip'
)
makedepends=(
  'pybind11'
  'python-build'
  'python-installer'
  'python-scikit-build-core'
  'python-wheel'
)

_pyname=laszip-python
source=(
  "$_pyname-$pkgver.tar.gz::https://github.com/tmontaigu/laszip-python/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
  '95d969063fdffc32495bf4dbd4e6a74108f942f5eee7cc19b951954b346657d6'
)

build() {
  cd "$_pyname-$pkgver"
  export SKBUILD_CMAKE_ARGS="-DUSE_VENDORED_LASZIP=OFF"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pyname-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/laszip-$pkgver-"*.whl
  test-env/bin/python -c 'import laszip'
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/laszip-$pkgver-"*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" License.txt
}
