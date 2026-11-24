# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
_name=quimb
pkgname=python-$_name
pkgver=1.16.0
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
b2sums=('d271f1f7c9250e47f17bd2925c4468e68083d47389745d4cc1255a5e22f9d41430d44e1b8c24a079e7ec04b8d5d70562959c51effdb39fd597cfc1efcabce6d6')

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
    test-env/bin/python -P -m pytest -o addopts="" \
        -k "not test_basic_compress_double_mpo and not test_mps_partial_mpo_apply"
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}
