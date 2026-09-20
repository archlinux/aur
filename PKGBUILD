# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-roboflow
_pkgname=roboflow
pkgver=1.4.2
pkgrel=1
pkgdesc="Official Python package for working with the Roboflow API"
arch=('any')
url="https://github.com/roboflow/roboflow-python"
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
  'python-pi-heif<2'
  'python-pillow-avif-plugin<2'
)
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
  "$pkgname-$pkgver.tar.gz::https://github.com/roboflow/roboflow-python/archive/refs/tags/v$pkgver.tar.gz"
  'relax-system-dependencies.patch'
  'typer-0.26.patch'
  'exclude-tests-package.patch'
  'offline-version-validation.patch'
)
sha256sums=(
  'ca39facd646f5d9615d9d343c8717df840e068e686543de1c801ffb0d69fff72'
  '198258ebfef1a31d04dac0bc65d49c2906f7c76a2662e9e1fbd52882b53db1d1'
  'edc9df623eca3a1d7aebcddb84f040c89a5f675cc163ade50179e509fe321a20'
  'bfe799a95ae3530f0b561cf9b6a3a4ec23b124210d3e74b0004fb0e4d3af6605'
  'a7e2142ef275e7799012e36b8fbe0be94c6ce2b69f6fcfc902f0844616f2b594'
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
