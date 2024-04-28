# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-laszip
pkgdesc='Python bindings for the LASzip compression library'
pkgver=0.2.3
pkgrel=2
url='https://github.com/tmontaigu/laszip-python'
license=('MIT')
arch=('x86_64')

depends=('gcc-libs' 'glibc' 'laszip')
makedepends=('pybind11' 'python-build' 'python-installer' 'python-scikit-build-core' 'python-wheel')

_pyname=laszip-python
source=(
  "$_pyname-$pkgver.tar.gz::https://github.com/tmontaigu/laszip-python/archive/refs/tags/$pkgver.tar.gz"
  'pyproject_toml_deps.patch'
  'add_headers.patch'
)
sha256sums=(
  '31572639a928fabf7d60a340970c6ae256ae9382e0420e938d6ab237553ac57b'
  '96b2417c81b1a2ba28804568c607bb947576327c1721189fc06b7d5492488dad'
  '3400d5091b0d78e838b95d2103d50cc4a21e7d3278a55044ec01b15985d7c2fd'
)

prepare() {
  cd "$_pyname-$pkgver"
  patch -p0 -i "$srcdir/pyproject_toml_deps.patch"
  patch -p0 -i "$srcdir/add_headers.patch"
}

build() {
  cd "$_pyname-$pkgver"
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
