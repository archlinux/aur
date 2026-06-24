# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=cotengra
pkgname=python-${_name}
pkgver=0.8.2
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
b2sums=('a302f2c026470ae059f1f219635dde2705215ccc1b4362acdc631b04394f7e94fd73bc9a37fe05f03d7004076854a1ace83d59cb2dc4524c28256f5ba4b4fc14')

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
