# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-typeshed-client
_name=typeshed_client
pkgver=2.12.0
pkgrel=2
pkgdesc='Library for accessing and resolving type stubs from typeshed'
arch=('any')
url='https://github.com/JelleZijlstra/typeshed_client'
license=('MIT')
depends=(
  'python>=3.9'
  'python-importlib_resources>=1.4.0'
  'python-typing_extensions>=4.5.0'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>=42'
  'python-wheel'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'LICENSE'
)
sha256sums=(
  'e8ad507a8cb776e45c9a757b2ab3101ef53dfdf8528319e49669ee454d05f671'
  'febc00dc5a0557ca8afbcdc6d3896731dc42f4cecabd87e6c98326212f8dbf36'
)

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local _site
  _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

  rm -rf "$srcdir/_check" "$srcdir/_testroot"
  python -m installer --destdir="$srcdir/_check" "$_name-$pkgver"/dist/*.whl
  install -d "$srcdir/_testroot"
  cp -a "$_name-$pkgver/tests" "$srcdir/_testroot/"

  cd "$srcdir/_testroot"
  PYTHONNOUSERSITE=1 \
    PYTHONPATH="$srcdir/_check$_site" \
    python -P tests/test.py

  PYTHONNOUSERSITE=1 \
    PYTHONPATH="$srcdir/_check$_site" \
    python -P - <<'PY'
from pathlib import Path

import typeshed_client

module_path = Path(typeshed_client.__file__).resolve()
stub_path = typeshed_client.get_stub_file("pathlib")
names = typeshed_client.get_stub_names("argparse")
resolved = typeshed_client.Resolver().get_fully_qualified_name(
    "collections.Counter"
)

assert "_check" in module_path.parts
assert stub_path is not None
assert stub_path.name == "__init__.pyi" and stub_path.parent.name == "pathlib"
assert names is not None and "ArgumentParser" in names
assert resolved is not None
PY
}

package() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python -m installer \
    --compile-bytecode 1 \
    --destdir="$pkgdir" \
    dist/*.whl
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.upstream"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.packaging"
}

# vim:set ts=2 sw=2 et:
