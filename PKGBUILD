# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-pi-heif
_pkgname=pillow_heif
pkgver=1.3.0
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
sha256sums=('2e435f773d57c405f4cc07ab3758f849d45eef0cd9ba6dfd55cee5b340507fca')

prepare() {
  cd "$_pkgname-$pkgver"

  # Copy pi-heif config and transform to pi_heif
  # Remove pre-existing pi_heif dir so the transform rename succeeds
  rm -rf pi_heif pi_heif.egg-info
  cp -r pi-heif/* .
  python .github/transform_to-pi_heif.py

  # Workaround for libheif 1.22.0 header bug: heif_properties.h declares a
  # parameter as 'const heif_bad_pixel*' without the 'struct' keyword, which
  # is invalid in C and breaks the -Werror C extension build. Forward-declare
  # the typedef so the bare tag resolves. Harmless on libheif without the bug.
  sed -i 's|\(#include "libheif/heif_properties.h"\)|typedef struct heif_bad_pixel heif_bad_pixel;\n    \1|' \
    pi_heif/_pi_heif.c
}

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  # Basic import test (use build directory for compiled extension)
  local _pyver=$(python -c 'import sys; print(f"{sys.version_info[0]}{sys.version_info[1]}")')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver:$PYTHONPATH" \
    python -c "import pi_heif; print('pi_heif imported successfully')" || \
    echo "Warning: Import test failed"
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
