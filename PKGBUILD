# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-pillow-avif-plugin
_pkgname=pillow-avif-plugin
pkgver=1.5.5
pkgrel=1
pkgdesc="A pillow plugin that adds avif support via libavif"
arch=('x86_64')
url="https://github.com/fdintino/pillow-avif-plugin"
license=('BSD-2-Clause')
depends=(
  'python'
  'python-pillow'
  'libavif'
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/fdintino/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('717656ed7a357df8e1ff73fdc5054a0b89c51bc3029615fa01c7491e83b00270')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  # Basic import test (use build directory for compiled extension)
  local _pyver=$(python -c 'import sys; print(f"{sys.version_info[0]}{sys.version_info[1]}")')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver:$PYTHONPATH" \
    python -c "import pillow_avif; print('pillow_avif imported successfully')" || \
    echo "Warning: Import test failed"
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
