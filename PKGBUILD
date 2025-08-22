# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
_name=quimb
pkgname=python-$_name
pkgver=1.11.2
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
    "python-matplotlib: for plotting"
    "python-mpi4py: support for solvers using MPI"
    "python-networkx: for computing distances between pairs of qubits"
)
checkdepends=(python-pytest)
source=($_name::git+https://github.com/jcmgray/$_name.git#tag=v$pkgver)
b2sums=('c9a4821f32034f7fb357068d8bd89e13cc848539a9812f7d7ab51e5aff87abf86ec3014e069121db104279e49dc35a39431453c398ffc191d23a28fcc57f2c01')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    rm -rf quimb
    # See https://github.com/jcmgray/quimb/issues/328
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" pytest tests -k "not test_equalize_norms"
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}
