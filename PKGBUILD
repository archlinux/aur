# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-roboflow
_pkgname=roboflow
pkgver=1.7.3
pkgrel=1
pkgdesc="Official Python package for working with the Roboflow API"
arch=('any')
url="https://github.com/roboflow-ai/roboflow-python"
license=('Apache-2.0')
depends=(
  'python'
  'python-certifi'
  'python-idna>=3.7'
  'python-cycler'
  'python-kiwisolver>=1.3.1'
  'python-matplotlib'
  'python-numpy>=1.18.5'
  'python-numpy<3'
  'python-opencv>=4.10'
  'python-opencv<6'
  'python-pillow>=7.1.2'
  'python-dateutil'
  'python-dotenv'
  'python-requests'
  'python-six'
  'python-urllib3>=1.26.6'
  'python-tqdm>=4.41.0'
  'python-yaml>=5.3.1'
  'python-packaging'
  'python-requests-toolbelt'
  'python-filetype'
  'python-typer>=0.12.0'
  'python-typer<0.28'
  'python-click>=8.0'
  'python-rich'
  'python-pillow-avif-plugin<2'
)
optdepends=('python-pillow-heif>=1.7.0: optional HEIC/HEIF image decoding')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-responses'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/roboflow-ai/roboflow-python/archive/refs/tags/v$pkgver.tar.gz"
  'relax-system-dependencies.patch'
  'typer-0.26.patch'
  'exclude-tests-package.patch'
  'offline-version-validation.patch'
)
sha256sums=(
  '85d9b7b17a000fce3fc4076931f1817d00ec4b00b0890b2f85c77688ef95a8d0'
  'c87994f60859a4567300a7e3f5904e03ea6fcc5ab3c1cbaed4f431e59e4ad04b'
  'b6db43e463780e15788b24cf3fae6bc573e02480c1996a672b6653244c55255e'
  '164f9cde4212275c3a4b6255d5b2750d337f61abd1014d2d17c0cbef481a5076'
  '7245b12ff6dceb2906d8bf5635a95ce272ec3f41daea97ccbcdb1380b76f4cf2'
)

prepare() {
  cd "$_pkgname-python-$pkgver"

  # The upstream caps are for its pinned PyPI environment (and NumPy's
  # Python-3.10 mypy run), not runtime API incompatibilities. The complete
  # suite validates Arch's NumPy 2.5, OpenCV 5 and Typer 0.27 stack.
  patch -Np1 -i "$srcdir/relax-system-dependencies.patch"
  patch -Np1 -i "$srcdir/typer-0.26.patch"

  # `find_packages(exclude=("tests",))` still includes every tests.*
  # subpackage in the wheel and risks collisions in site-packages.
  patch -Np1 -i "$srcdir/exclude-tests-package.patch"

  # These project-type tests are pure validation checks, but their fixture
  # probes the live API while constructing Version. Preserve all assertions
  # and make only that incidental probe deterministic and offline.
  patch -Np1 -i "$srcdir/offline-version-validation.patch"
}

build() {
  cd "$_pkgname-python-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-python-$pkgver"

  local _site_packages
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib").lstrip("/"))')"
  rm -rf "$srcdir/test-install" "$srcdir/test-root"
  python -m installer --destdir="$srcdir/test-install" dist/*.whl
  mkdir -p "$srcdir/test-root"
  cp -a tests "$srcdir/test-root/"
  # The CLI subprocess test replaces PYTHONPATH with the source root. Keep
  # its assertions, but make its subprocess use the same staged wheel.
  sed -i 's@env\["PYTHONPATH"\] = str(Path(__file__).resolve().parents\[1\])@env["PYTHONPATH"] = os.environ["PYTHONPATH"]@' \
    "$srcdir/test-root/tests/test_region_config.py"

  # Upstream's CI entry point is unittest. Copying the suite outside the
  # source tree ensures every import exercises the staged wheel.
  cd "$srcdir/test-root"
  PYTHONNOUSERSITE=1 PYTHONPATH="$srcdir/test-install/$_site_packages" \
    python -P -m unittest discover -v -s tests -t .

  ROBOFLOW_STAGED_ROOT="$srcdir/test-install" \
    PYTHONNOUSERSITE=1 PYTHONPATH="$srcdir/test-install/$_site_packages" \
    python -P - <<'PY'
from io import BytesIO
import os
from pathlib import Path
from tempfile import TemporaryDirectory

from PIL import Image
import roboflow
from roboflow.util.image_utils import check_image_path, file2jpeg, load_labelmap

staged = Path(os.environ["ROBOFLOW_STAGED_ROOT"]).resolve()
assert Path(roboflow.__file__).resolve().is_relative_to(staged)

with TemporaryDirectory() as directory:
    root = Path(directory)
    source = root / "source.png"
    labels = root / "labels.yaml"
    Image.new("RGB", (32, 20), (25, 100, 220)).save(source)
    labels.write_text("names:\n  0: background\n  1: object\n", encoding="utf-8")
    assert check_image_path(str(source))
    converted = Image.open(BytesIO(file2jpeg(str(source))))
    converted.load()
    assert converted.format == "JPEG" and converted.size == (32, 20)
    assert load_labelmap(str(labels)) == {0: "background", 1: "object"}
PY
}

package() {
  cd "$_pkgname-python-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
