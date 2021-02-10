# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='boost-histogram'
pkgname="python-${_pkgname}"
pkgver='0.12.0'
pkgrel=1
pkgdesc="Python bindings for Boost's Histogram library."
arch=('x86_64')
url='https://github.com/scikit-hep/boost-histogram'
license=('custom:BSD3')
depends=('boost-libs' 'python-numpy')
makedepends=('boost' 'git' 'pybind11' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-benchmark')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${python_version}" pytest || return 0  # one test fails due to Boost bug - https://github.com/boostorg/histogram/pull/302
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install  --skip-build --root="${pkgdir}/" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
