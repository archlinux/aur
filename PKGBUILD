# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
_name=quimb
pkgname=python-$_name
pkgver=1.13.0
pkgrel=1
pkgdesc="Quantum information and many-body calculations including tensor networks"
arch=(any)
url=https://github.com/jcmgray/quimb
license=(Apache-2.0)
depends=(
    python-autoray
    python-cotengra
    python-cytoolz
    python-numba
    python-numpy
    python-psutil
    python-scipy
    python-tqdm
)
makedepends=(
    git
    python-build
    python-installer
    python-hatch-vcs
    python-hatchling
    python-wheel
)
optdepends=(
    "python-autograd: support for gradient-based optimizations"
    "python-cmaes: support for Covariance Matrix Adaptation Evolution Strategy (CMA-ES)"
    # "python-cotengrust: for tensor networks"
    # "python-kahypar: support for hypergraphs"
    "python-matplotlib: for plotting"
    "python-mpi4py: support for solvers using MPI"
    "python-networkx: for computing distances between pairs of qubits"
    "pyton-plotly: for plotting"
    "python-pygraphviz: for plotting"
)
checkdepends=(python-pytest)
source=($_name::git+https://github.com/jcmgray/$_name.git#tag=v$pkgver)
b2sums=('0f641de97eed8c0928e711b8141c46bc9b63dce407324d7a0e84e66f4b1ce3f9ab4efefb632af47bcc87ba7ee3a87c6bd4e0a53238ee102d69409f91c8d8ab63')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf $_name
	# Disable some new tests due to small allowed deviations
	# See: https://github.com/jcmgray/quimb/issues/354
    test-env/bin/python -P -m pytest -o addopts="" -k "not test_basic_compress_double_mpo"
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}
