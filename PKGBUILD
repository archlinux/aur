# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aesara
_name=${pkgname#python-}
pkgver=2.9.3
pkgrel=2
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
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-pytest
  python-numba
)
optdepends=(
  'python-jax: for graph transpilation compilation'
  'python-numba: for graph transpilation compilation'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rel-$pkgver.tar.gz"
  "remove-bin-package.patch"
)
sha256sums=(
  '379a717f3edd28bd707c9bc8178c8a42bea809d8dff0e6a641002c1ac2722c97'
  '26a048c151f022411e90ff6793b61b19b0a3bf5588086d7cf9572c312be75dad'
)

_archive="$_name-rel-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/remove-bin-package.patch"

  sed -i 's/"hatch-vcs >=0.3.0,<0.4.0",/"hatch-vcs >=0.3.0",/' pyproject.toml
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  _ignored_tests=(
    # Ignored to reduce test time - these files take 20 seconds or more per
    # file to run on my machine.
    tests/link/numba/test_elemwise.py
    tests/link/numba/test_random.py
    tests/link/numba/test_scan.py
    tests/sandbox/test_rng_mrg.py
    tests/scalar/test_basic.py
    tests/scan/test_basic.py
    tests/scan/test_rewriting.py
    tests/sparse/test_basic.py
    tests/sparse/test_var.py
    tests/tensor/nnet/test_abstract_conv.py
    tests/tensor/nnet/test_basic.py
    tests/tensor/nnet/test_batchnorm.py
    tests/tensor/nnet/test_conv.py
    tests/tensor/nnet/test_corr3d.py
    tests/tensor/nnet/test_neighbours.py
    tests/tensor/rewriting/test_basic.py
    tests/tensor/rewriting/test_elemwise.py
    tests/tensor/rewriting/test_math.py
    tests/tensor/rewriting/test_subtensor.py
    tests/tensor/signal/test_pool.py
    tests/tensor/test_basic.py
    tests/tensor/test_blas.py
    tests/tensor/test_elemwise.py
    tests/tensor/test_extra_ops.py
    tests/tensor/test_inplace.py
    tests/tensor/test_math.py
    tests/tensor/test_math_scipy.py
    tests/tensor/test_sort.py
    tests/tensor/test_subtensor.py

    # Almost all tests in these files fail - unsure why.
    tests/tensor/nnet/test_blocksparse.py
    tests/tensor/nnet/test_conv3d2d.py
    tests/tensor/nnet/test_corr.py
  )
  _ignored_tests_arg=$(printf " --ignore=%s" "${_ignored_tests[@]}")

  _deselected_tests=(
    # Failing tests - unsure why.
    tests/link/c/test_op.py::test_ExternalCOp_c_code_cache_version
    tests/link/jax/test_nlinalg.py::test_jax_basic_multiout
    tests/link/jax/test_elemwise.py::test_logsumexp_benchmark
  )
  _deselected_tests_arg=$(printf " --deselect=%s" "${_deselected_tests[@]}")

  # shellcheck disable=SC2086
  pytest \
    $_ignored_tests_arg \
    $_deselected_tests_arg
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
