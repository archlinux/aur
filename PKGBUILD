# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='boost-histogram'
pkgname="python-${_pkgname}"
pkgver='1.3.2'
pkgrel=2
pkgdesc="Python bindings for Boost's Histogram library."
arch=('x86_64')
url='https://github.com/scikit-hep/boost-histogram'
license=('custom:BSD3')
depends=('python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-benchmark')
source=(
  "${pkgname}::git+https://github.com/scikit-hep/boost-histogram.git#tag=v${pkgver}"
  "${pkgname}-pybind11::git+https://github.com/pybind/pybind11.git"
  "${pkgname}-histogram::git+https://github.com/boostorg/histogram.git"
  "${pkgname}-core::git+https://github.com/boostorg/core.git"
  "${pkgname}-mp11::git+https://github.com/boostorg/mp11.git"
  "${pkgname}-config::git+https://github.com/boostorg/config.git"
  "${pkgname}-throw_exception::git+https://github.com/boostorg/throw_exception.git"
  "${pkgname}-assert::git+https://github.com/boostorg/assert.git"
  "${pkgname}-variant2::git+https://github.com/boostorg/variant2.git"
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
  cd "${srcdir}/${pkgname}"
  git submodule init

  git config submodule."pybind11".url "${srcdir}/${pkgname}"-pybind11
  git config submodule."extern/boosthistogram".url "${srcdir}/${pkgname}"-histogram
  git config submodule."extern/core".url "${srcdir}/${pkgname}"-core
  git config submodule."extern/mp11".url "${srcdir}/${pkgname}"-mp11
  git config submodule."extern/config".url "${srcdir}/${pkgname}"-config
  git config submodule."extern/throw_exception".url "${srcdir}/${pkgname}"-throw_exception
  git config submodule."extern/assert".url "${srcdir}/${pkgname}"-assert
  git config submodule."extern/variant2".url "${srcdir}/${pkgname}"-variant2

  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
