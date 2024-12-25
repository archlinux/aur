# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='mplhep'
pkgname="python-${_pkgname}"
pkgver=0.3.55
pkgrel=1
pkgdesc="A set of helpers for matplotlib to more easily produce plots typically needed in HEP."
arch=('any')
url='https://github.com/scikit-hep/mplhep'
license=('MIT')
depends=('python-numpy' 'python-matplotlib' 'python-mplhep_data' 'python-uhi' 'python-packaging')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-boost-histogram' 'python-scipy' 'python-uproot' 'python-scikit-hep-testdata' 'python-hist' 'python-fsspec')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('8abb058de47c23a79f173be79b14ce834c096d6da40269bab4325bca2a027936')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  find tests -type f -exec sed \
      -e 's@uproot4@uproot@g' \
      -i {} \;
  PYTHONPATH="${PWD}/build/lib:${PWD}/src" pytest tests
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
