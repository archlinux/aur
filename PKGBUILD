# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit
pkgname=python-${_pkgname}
pkgver=1.4.2
pkgrel=1
epoch=1
pkgdesc="An open-source SDK for working with (IBM) quantum computers"
arch=(x86_64)
url=https://github.com/Qiskit/qiskit
license=(Apache-2.0)
conflicts=(python-qiskit-terra)
depends=(
    python-dateutil
    python-dill
    python-numpy
    python-rustworkx
    python-scipy
    python-stevedore
    python-symengine-0.13
    python-sympy
)
optdepends=(
    'ipython: interactivity'
    'python-constraint: support for handling CSPs (Constraint Solving Problems)'
    'python-cvxpy: convex optimization problems'
    'python-matplotlib: plotting support'
    'python-pillow: image support'
    "python-pydot: Graphviz's Dot support"
    'python-pylatexenc: LaTeX support emoji selector'
    'python-qiskit-aer: high performance simulator for quantum circuits'
    'python-qiskit-experiments: tools for building, running, and analysis of experiments on noisy quantum computers'
    'python-qiskit-finance: stock/securities problems, portfolio optimizations and finance experiments'
    'python-qiskit-machine-learning: sample datasets and quantum classification algorithms'
    'python-qiskit-nature: ground state energy computations, excited states and dipole moments of molecules'
    'python-qiskit-optimization: quantum optimization algorithms'
    'python-qiskit-qasm3-import: import OpenQASM 3 files'
    'python-scikit-learn: machine learning and data mining'
    'python-seaborn: statistical data visualization'
    'python-z3-solver: theorem prover'
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-setuptools-rust
    python-wheel
)
checkdepends=(
    ipython
    python-ddt
    python-stestr
)
source=($_pkgname-$pkgver.tar.gz::https://github.com/Qiskit/$_pkgname/archive/$pkgver.tar.gz)
b2sums=('99afd2b678d9aa7cc81c36adb10c54f51340a40a5bbf996905473fdae61adcdc9c110b511c96435ab4695b8198030fee4b79eaddfd8aff793e1f8801902cdc07')

build() {
    cd $_pkgname-$pkgver
    export CARGO_TARGET_DIR=target
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname-$pkgver
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    rm -rf qiskit
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" \
    PYTHONWARNINGS="ignore::DeprecationWarning,ignore::PendingDeprecationWarning,ignore::RuntimeWarning" \
    stestr run -d test/python -E "test_equivalence_draw"
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
