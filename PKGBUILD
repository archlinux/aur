# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytensor
_name=${pkgname#python-}
pkgver=2.17.4
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
  "unpin-numpy.patch"
)
sha256sums=(
  '2004df8ab9646d4ad273a06144ced15883953917d72c293db7095de4ed336039'
  '73360d53a5c5e5718a544c69218d3d64adc2390007a9b6781f7b61cc32415e59'
  '88d090f3460b0f84d9cc54b7d97298685e87e102ff944eb1fd2b3b34f844a492'
)

_archive="$_name-rel-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/remove-bin-package.patch"
  sed -i 's/versioneer\[toml\]==/versioneer\[toml\]>=/' pyproject.toml
  patch --forward --strip=1 --input="$srcdir/unpin-numpy.patch"
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
