# Maintainer: Phillip Davies <philliptdavies at gmail dot com>
pkgname=pros-cli
pkgver=3.5.6
pkgrel=2
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('any')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
depends=('python'
  'python-click'
  'python-rich-click'
  'python-pyserial'
  'python-cachetools'
  'python-requests'
  'python-requests-futures'
  'python-tabulate'
  'python-jsonpickle'
  'python-semantic-version'
  'python-colorama'
  'python-pyzmq'
  'python-cobs'
  'clang'
  'python-sentry_sdk'
  'python-pypng'
  'python-installer'
  'arm-none-eabi-newlib'
  'arm-none-eabi-gcc')

makedepends=('python-build'
  'python-installer')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f9095e68ceea4ca783c425ecb90da7a58f2870797e190997365ebd4f14f0986c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Fix version detection for Python 3.14+
  local utils_file
  utils_file=$(find "$pkgdir/usr/lib" \
    -path '*/site-packages/pros/common/utils.py' \
    -print -quit)

  if [[ -z "$utils_file" ]]; then
    error "Could not find PROS utils.py"
    return 1
  fi

  python - "$utils_file" <<'PY'
from pathlib import Path
import sys

path = Path(sys.argv[1])
source = path.read_text()

needle = "    try:\n        import pkg_resources\n"
replacement = """    try:
        from importlib.metadata import version
        ver = version("pros-cli")
        if ver is not None:
            return ver
    except Exception:
        pass
    try:
        import pkg_resources
"""

if needle not in source:
    raise SystemExit("Could not find expected version detection code")

path.write_text(source.replace(needle, replacement, 1))
PY

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
