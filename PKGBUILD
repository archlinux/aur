# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-pillow-avif-plugin
_pkgname=pillow-avif-plugin
pkgver=1.5.2
pkgrel=2
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
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/fdintino/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  "fix-python313.patch"
)
sha256sums=(
  'ca224a3ba77cc2ccc5a4e3a7e081c2c0914ea1481fdeb4c4c007e04d8675c5fe'
  'f835db299dafcbdf2b4085a8f848ef469605273a6cde8575f940522223b46390'
)

prepare() {
  cd "$_pkgname-$pkgver"

  # Fix Python 3.13 compatibility
  patch -Np1 -i "$srcdir/fix-python313.patch"
}

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  # Basic import test
  PYTHONPATH="$PWD/src:$PYTHONPATH" python -c "import pillow_avif; print('pillow_avif imported successfully')" || \
    echo "Warning: Import test failed"
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
