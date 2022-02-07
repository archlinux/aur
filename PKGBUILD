# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='mplhep'
pkgname="python-${_pkgname}"
pkgver='0.3.15'
pkgrel=1
pkgdesc="A set of helpers for matplotlib to more easily produce plots typically needed in HEP."
arch=('any')
url='https://github.com/scikit-hep/mplhep'
license=('MIT')
depends=('python-numpy' 'python-matplotlib' 'python-mplhep_data' 'python-uhi' 'python-packaging')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-importlib-metadata' 'python-boost-histogram' 'python-scipy' 'python-uproot')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py bdist_egg
}

check() {
  cd "${srcdir}/${pkgname}"
  find tests -type f -exec sed \
      -e 's@uproot4@uproot@g' \
      -i {} \;
  # some tests fail because of unpackaged deps
  # PYTHONPATH="${PWD}/build/lib:${PWD}/src" pytest
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install  --skip-build --root="${pkgdir}/" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
