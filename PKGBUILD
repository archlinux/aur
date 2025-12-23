# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='mplhep'
pkgname="python-${_pkgname}"
pkgver=0.4.1
pkgrel=3
pkgdesc="A set of helpers for matplotlib to more easily produce plots typically needed in HEP."
arch=('any')
url='https://github.com/scikit-hep/mplhep'
license=('MIT')
depends=('python-numpy' 'python-matplotlib' 'python-mplhep_data' 'python-uhi' 'python-packaging')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-boost-histogram' 'python-scipy' 'python-uproot' 'python-scikit-hep-testdata' 'python-hist' 'python-fsspec')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('99a1b74d4979d32581977b6ec740c39ab3ddd805119be7c2efb3b3e47c217592')

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
