# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytensor
_name=${pkgname#python-}
pkgver=2.18.6
pkgrel=2
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
  python-jax
  python-numba
  python-pytest
  python-pytest-benchmark
  python-pytest-mock
  python-tensorflow-probability
)
optdepends=(
  'python-jax: for graph transpilation compilation via JAX'
  'python-tensorflow-probability: for graph transpilation compilation via JAX'
  'python-numba: for graph transpilation compilation via Numba'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rel-$pkgver.tar.gz"
  "remove-bin-package.patch"
)
sha256sums=(
  '393815578b527b90bc46dddff0355bf31447e8c3bd8c6c735f7d63532ecda464'
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

  _ignored_tests=(
    # d3viz functionality is currently not being maintained, see:
    # https://github.com/pymc-devs/pytensor/issues/333
    tests/d3viz/test_d3viz.py

    # I suspect this affects the global environment, specifically modifying
    # pytensor.config.profile_optimizer, which makes other tests fail, see:
    # https://github.com/pymc-devs/pytensor/issues/591
    tests/test_printing.py

    # Most time-consuming test files, ignore these to make test duration
    # more reasonable.
    tests/link/numba/test_elemwise.py
    tests/link/numba/test_scan.py
    tests/scalar/test_basic.py
    tests/scan/test_basic.py
    tests/scan/test_checkpoints.py
    tests/scan/test_rewriting.py
    tests/sparse/test_basic.py
    tests/sparse/test_var.py
    tests/tensor/conv/test_abstract_conv.py
    tests/tensor/rewriting/test_basic.py
    tests/tensor/rewriting/test_elemwise.py
    tests/tensor/rewriting/test_math.py
    tests/tensor/rewriting/test_subtensor.py
    tests/tensor/test_basic.py
    tests/tensor/test_blas.py
    tests/tensor/test_blockwise.py
    tests/tensor/test_casting.py
    tests/tensor/test_elemwise.py
    tests/tensor/test_extra_ops.py
    tests/tensor/test_inplace.py
    tests/tensor/test_math.py
    tests/tensor/test_math_scipy.py
    tests/tensor/test_slinalg.py
    tests/tensor/test_sort.py
    tests/tensor/test_subtensor.py
  )
  _ignored_tests_arg=$(printf " --ignore=%s" "${_ignored_tests[@]}")

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  export PYTHONPATH="$PWD/tmp_install/$_site_packages"
  # shellcheck disable=SC2086
  pytest tests \
    $_ignored_tests_arg
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
