# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='hist'
pkgname="python-${_pkgname}"
pkgver='2.7.2'
pkgrel=3
pkgdesc="Python bindings for Boost's Histogram library."
arch=('any')
url='https://github.com/scikit-hep/hist'
license=('BSD-3-Clause')
depends=('python' 'python-boost-histogram' 'python-histoprint')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'python-hatchling' 'python-hatch-vcs')
# NOTE: python-dask_histogram needs to be packaged for the tests and optdepends
checkdepends=('python-dask' 'python-pytest' 'python-pytest-benchmark' 'python-pytest-mpl' 'python-iminuit' 'python-mplhep' 'python-scipy')
optdepends=(
  'python-dask: for dask support'
  'python-iminuit: for fit support'
  'python-matplotlib: for mpl and plot support'
  'python-mplhep: for mpl and plot support'
  'python-scipy: for fit support'
)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('a4610816497d2a64ea5f86f49062f93ad9e6e2fd130220199e18a73967f7bbc3')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"
  PYTHONPATH="${PWD}/src" pytest
}

package() {
  cd "${pkgname}"
  export PYTHONHASHSEED=0
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
