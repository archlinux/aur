# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=cotengra
pkgname=python-${_name}
pkgver=0.8.3
pkgrel=1
pkgdesc="Hyper optimized contraction trees for large tensor networks and einsums"
arch=(any)
url=https://github.com/jcmgray/cotengra
license=(Apache-2.0)
depends=(
    python-autoray
    python-networkx
    python-numpy
    python-tqdm
)
makedepends=(
    git
    python-build
    python-installer
    python-hatch-vcs
    python-hatchling
)
checkdepends=(
    python-matplotlib
    python-pytest
    python-seaborn
)
optdepends=(
    "python-cmaes: support for CMA evolution strategy"
    "python-cotengrust: rust accelerated contraction ordering primitives"
    "python-cytoolz: high performance functional utilities"
    "python-kahypar: partitioning graphs and hypergraphs"
    "python-opt_einsum: optimized einsum functions"
    "python-optuna: hyperparameter optimization"
    "python-ray: support for distributed applications"
)
source=($_name::git+https://github.com/jcmgray/$_name.git#tag=v$pkgver)
b2sums=('2f9cda157e111ba599a38b13929ac87eaf0ec0a363b726cf5a3b6aedb864afc5b5931bc1188f6a076bb7365be483ca1e2d6e8e28937aa7633629d4094657993d')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
   local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
   python -m installer --destdir=test_dir $_name/dist/*.whl
   rm -rf $_name/cotengra
   PYTHONPATH="$PWD/test_dir/usr/lib/python$python_version/site-packages" pytest -v $_name/tests
}

package() {
    python -m installer --destdir="$pkgdir" $_name/dist/*.whl
}
