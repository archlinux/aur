# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytensor
_pkgname=${pkgname#python-}
pkgver=2.19.0
_commit=4ee358818543ee271b7922f5ccf988ef9338591f
pkgrel=1
pkgdesc="Fork of Aesara -- Library for defining, optimizing, and efficiently evaluating mathematical expressions involving multi-dimensional arrays"
arch=(x86_64)
url="https://github.com/pymc-devs/pytensor"
license=(LicenseRef-PyTensorLicense)
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
  git
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
  'python-numba: for graph transpilation compilation via Numba'
  'python-tensorflow-probability: for graph transpilation compilation via JAX'
)
source=(
  "git+$url.git#commit=$_commit"
  "remove-bin-package.patch"
)
sha256sums=(
  'SKIP'
  '73360d53a5c5e5718a544c69218d3d64adc2390007a9b6781f7b61cc32415e59'
)

_archive="$_pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags | sed 's/^rel-//'
}

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

  local ignore_test_args=(
    # d3viz functionality is currently not being maintained, see:
    # https://github.com/pymc-devs/pytensor/issues/333
    --ignore=tests/d3viz/test_d3viz.py

    # I suspect this affects the global environment, specifically modifying
    # pytensor.config.profile_optimizer, which makes other tests fail, see:
    # https://github.com/pymc-devs/pytensor/issues/591
    --ignore=tests/test_printing.py

    # Raises ImportError when importing 'bijectors' from "partially
    # initialized" module 'tensorflow_probability.substrates.jax', not sure
    # why.
    --ignore=tests/link/jax/test_scalar.py

    # Most time-consuming test files, ignore these to make test duration
    # more reasonable.
    --ignore=tests/link/numba/test_elemwise.py
    --ignore=tests/link/numba/test_scan.py
    --ignore=tests/scalar/test_basic.py
    --ignore=tests/scan/test_basic.py
    --ignore=tests/scan/test_checkpoints.py
    --ignore=tests/scan/test_rewriting.py
    --ignore=tests/sparse/test_basic.py
    --ignore=tests/sparse/test_var.py
    --ignore=tests/tensor/conv/test_abstract_conv.py
    --ignore=tests/tensor/rewriting/test_basic.py
    --ignore=tests/tensor/rewriting/test_elemwise.py
    --ignore=tests/tensor/rewriting/test_math.py
    --ignore=tests/tensor/rewriting/test_subtensor.py
    --ignore=tests/tensor/test_basic.py
    --ignore=tests/tensor/test_blas.py
    --ignore=tests/tensor/test_blockwise.py
    --ignore=tests/tensor/test_casting.py
    --ignore=tests/tensor/test_elemwise.py
    --ignore=tests/tensor/test_extra_ops.py
    --ignore=tests/tensor/test_inplace.py
    --ignore=tests/tensor/test_math.py
    --ignore=tests/tensor/test_math_scipy.py
    --ignore=tests/tensor/test_slinalg.py
    --ignore=tests/tensor/test_sort.py
    --ignore=tests/tensor/test_subtensor.py
  )

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest tests "${ignore_test_args[@]}"
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
