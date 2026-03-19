# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='vector'
pkgname="python-${_pkgname}"
pkgver=1.8.0
pkgrel=1
pkgdesc="A library for 2D, 3D, and Lorentz vectors, especially arrays of vectors, to solve common physics problems in a NumPy-like way."
arch=('any')
url='https://github.com/scikit-hep/vector'
license=('MIT')
depends=('python-numpy' 'python-packaging')
optdepends=('python-awkward: Awkward array support')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest' 'python-awkward' 'python-papermill' 'python-fsspec' 'python-ipykernel' 'python-sympy')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('53a0a81ed41bf6f5c270a9f5fe11b6fdbb62d1d12a19b4c107a4a8e8f095c3fb')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  PYTHONPATH="${PWD}/build/lib:${PWD}/src" pytest -k 'not test_intro' --deselect tests/test_notebooks.py::test_numba
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
