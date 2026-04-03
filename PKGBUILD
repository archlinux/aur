# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='hist'
pkgname="python-${_pkgname}"
pkgver=2.9.1
pkgrel=1
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
sha256sums=('40d9142ceb182699a12764c0add26a0f9d65ab292b7832265d4dc02cc1be950d')

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
