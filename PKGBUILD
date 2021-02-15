# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='boost-histogram'
pkgname="python-${_pkgname}"
pkgver='0.12.0'
pkgrel=2
pkgdesc="Python bindings for Boost's Histogram library."
arch=('x86_64')
url='https://github.com/scikit-hep/boost-histogram'
license=('custom:BSD3')
depends=('python-numpy')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-benchmark')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
  git+https://github.com/pybind/pybind11.git
  git+https://github.com/boostorg/histogram.git
  git+https://github.com/boostorg/core.git
  git+https://github.com/boostorg/config.git
  git+https://github.com/boostorg/mp11.git
  git+https://github.com/boostorg/throw_exception.git
  git+https://github.com/boostorg/variant2.git
  git+https://github.com/boostorg/assert.git
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git submodule init

  git config submodule."pybind11".url "${srcdir}"/pybind11
  git config submodule."extern/boosthistogram".url "${srcdir}"/histogram
  git config submodule."extern/core".url "${srcdir}"/core
  git config submodule."extern/mp11".url "${srcdir}"/mp11
  git config submodule."extern/config".url "${srcdir}"/config
  git config submodule."extern/throw_exception".url "${srcdir}"/throw_exception
  git config submodule."extern/assert".url "${srcdir}"/assert
  git config submodule."extern/variant2".url "${srcdir}"/variant2
  git submodule update --recursive
}

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
