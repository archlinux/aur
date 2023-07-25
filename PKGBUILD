# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aesara
_name=${pkgname#python-}
pkgver=2.9.1
pkgrel=1
pkgdesc="Library for defining, optimizing, and efficiently evaluating mathematical expressions involving multi-dimensional arrays"
arch=(any)
url="https://github.com/aesara-devs/aesara"
license=(custom)
depends=(
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
  python-sympy
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-hatchling
  python-hatch-vcs
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
  'a174ec65a29a2cd86b1ab426ba755785fcd767b0c48564a8aa40ce44f120d34b'
  '26a048c151f022411e90ff6793b61b19b0a3bf5588086d7cf9572c312be75dad'
)

_archive="$_name-rel-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/remove-bin-package.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest \
    tests/misc/ \
    tests/scalar/ \
    tests/sparse/ \
    tests/test_breakpoint.py \
    tests/test_config.py \
    tests/test_gradient.py \
    tests/test_ifelse.py \
    tests/test_printing.py \
    tests/test_raise_op.py \
    tests/test_rop.py \
    tests/test_updates.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
