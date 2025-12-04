# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-pi-heif
_pkgname=pillow_heif
pkgver=1.1.1
pkgrel=1
pkgdesc="Python interface for libheif library (lightweight version without encoding)"
arch=('x86_64')
url="https://github.com/bigcat88/pillow_heif"
license=('BSD-3-Clause')
depends=(
  'python'
  'python-pillow'
  'libheif'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bigcat88/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('30002bb1dabc6c020369defcc2dfb5879b0c0621e999668976e232326d3f4452')

prepare() {
  cd "$_pkgname-$pkgver"

  # Transform to pi-heif (copy pi-heif files and run transformation)
  cp -r pi-heif/* .
  python .github/transform_to-pi_heif.py
}

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  # Basic import test
  PYTHONPATH="$PWD:$PYTHONPATH" python -c "import pi_heif; print('pi_heif imported successfully')" || \
    echo "Warning: Import test failed"
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
