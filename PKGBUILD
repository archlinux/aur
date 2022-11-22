# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-terra
pkgname=python-${_pkgname}
pkgver=0.22.2
pkgrel=1
pkgdesc="An open-source framework for working with noisy quantum computers at the level of pulses, circuits, and algorithms"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-terra"
license=('Apache')
depends=(
    'cython'
    'python-dateutil'
    'python-dill'
    'python-numpy'
    'python-ply'
    'python-psutil'
    'python-rustworkx'
    'python-scipy'
    'python-stevedore'
    'python-symengine'
    'python-sympy'
    'python-tweedledum'
)

optdepends=(
    'cplex: commercial solver for mathematical optimization problems'
    'python-constraint: support for handling CSPs (Constraint Solving Problems)'
    'python-docplex: IBM Decision Optimization CPLEX Modeling'
    'python-ipywidgets: IPython HTML widgets for Jupyter'
    'python-matplotlib: plotting support'
    'python-pillow: image support'
    "python-pydot: Graphviz's Dot support"
    'python-pygments: syntax highlighter'
    'python-pylatexenc: LaTeX support'
    'python-seaborn: statistical data visualization'
    #'z3-solver: efficient SMT solver library'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-rust'
    'python-wheel'
)
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz"
    "rustworkx.patch"
)
b2sums=(
    '2bc25a93e573fa9fa464f3cac5df2fefd0cbb372ff718e4ddc55ea377a1cb532002c1589b1ee551ceeb3fa2b5ba5c49f1a749ec86e85578e64e69e642558ba6a'
    '94133e4479ad918a8b40bdb53c91e44f2cd5eb85ed3831b559e643f3cf5b985ad11fa27bb16096995e59af67611902595e0e6b10f2b71e8624ff8eadb9a36a1f'
)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/rustworkx.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
