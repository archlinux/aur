# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytensor
_name=${pkgname#python-}
pkgver=2.18.5
pkgrel=1
pkgdesc="Fork of Aesara -- Library for defining, optimizing, and efficiently evaluating mathematical expressions involving multi-dimensional arrays"
arch=(x86_64)
url="https://github.com/pymc-devs/pytensor"
license=(custom)
depends=(
  glibc
  python
  python-cons
  python-etuples
  python-filelock
  python-llvmlite
  python-logical-unification
  python-minikanren
  python-numpy
  python-pydot
  python-scipy
  python-setuptools
  python-typing_extensions
)
makedepends=(
  cython
  python-build
  python-installer
  python-versioneer
  python-wheel
)
checkdepends=(
  python-pytest
)
optdepends=(
  'python-numba: for graph transpilation compilation'
  'python-jax: for graph transpilation compilation'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rel-$pkgver.tar.gz"
  "remove-bin-package.patch"
)
sha256sums=(
  '2808dd15ab233b1f479f2da95f285e3314ca82e4624b930742c57cfb0170cbc7'
  '73360d53a5c5e5718a544c69218d3d64adc2390007a9b6781f7b61cc32415e59'
)

_archive="$_name-rel-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/remove-bin-package.patch"
  sed -i 's/versioneer\[toml\]==/versioneer\[toml\]>=/' pyproject.toml
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest \
    tests/misc/ \
    tests/test_breakpoint.py \
    tests/test_config.py \
    tests/test_printing.py \
    tests/test_raise_op.py \
    tests/test_updates.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 doc/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
