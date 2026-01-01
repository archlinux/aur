# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-laszip
pkgdesc='Python bindings for the LASzip compression library'
pkgver=0.3.0
pkgrel=1
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
  'include_header_dir.patch'
)
sha256sums=(
  'cc33c46d8956e3f8446c92b95f2d162e182088cf54b53d9ba30f2c0089b197d5'
  'd4b71285ba691b6255c431f74decc066aad69e145ab3228c9902597cc90f6812'
)

prepare() {
  cd "$_pyname-$pkgver"
  patch -p0 -i "$srcdir/include_header_dir.patch"
}

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
