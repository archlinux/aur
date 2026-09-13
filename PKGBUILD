# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pillow-avif-plugin
_pkgname=pillow-avif-plugin
pkgver=1.6.0
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
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/fdintino/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  'aom-3.14-test.patch'
)
sha256sums=(
  '266eff6e8e6eae1ae976a5986b461e122d4fdc046fbc3fbe97c81817bad03c16'
  'af823f1665fc5a4218885f9af15212e379b17029994f6775880c710cae6d36a2'
)

prepare() {
  cd "$_pkgname-$pkgver"

  # AOM 3.14 uses PSNR tuning by default, so upstream's control and
  # `tune=psnr` encodings are identical. SSIM still exercises the same
  # advanced-option passthrough while producing a distinct encoding.
  patch -Np1 -i "$srcdir/aom-3.14-test.patch"
}

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  local _site_packages
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib").lstrip("/"))')"
  rm -rf "$srcdir/test-install"
  python -m installer --destdir="$srcdir/test-install" dist/*.whl

  # Keep the project root available for its tests package, while importing
  # pillow_avif exclusively from the staged wheel.
  PYTHONPATH="$PWD:$srcdir/test-install/$_site_packages" \
    python -P -m pytest --import-mode=importlib tests

  # Exercise the staged plugin through Pillow's normal encode/decode API.
  PYTHONPATH="$srcdir/test-install/$_site_packages" python -P - <<'PY'
from io import BytesIO
from pathlib import Path
import os

from PIL import Image
import pillow_avif

staged = Path(os.environ["PYTHONPATH"]).resolve()
assert Path(pillow_avif.__file__).resolve().is_relative_to(staged)

source = Image.new("RGB", (32, 20), (48, 132, 208))
encoded = BytesIO()
source.save(encoded, "AVIF", quality=100, subsampling="4:4:4")
assert encoded.tell() > 100
encoded.seek(0)
with Image.open(encoded) as decoded:
  assert decoded.format == "AVIF"
  assert decoded.size == source.size
  assert decoded.mode == "RGB"
  pixel = decoded.getpixel((16, 10))
  assert max(abs(actual - expected) for actual, expected in zip(pixel, (48, 132, 208))) <= 12
PY
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
