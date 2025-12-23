# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='boost-histogram'
pkgname="python-${_pkgname}"
pkgver=1.6.1
pkgrel=1
pkgdesc="Python bindings for Boost's Histogram library."
arch=('x86_64')
url='https://github.com/scikit-hep/boost-histogram'
license=('custom:BSD3')
depends=('python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-scikit-build-core' 'python-setuptools-scm' 'pybind11')
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

sha256sums=('bb58ed2c4215f8bf71d70c6eacbe80ba23fe331a47cf26da6bbbc719fa0b31af'
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
  git config submodule."extern/histogram".url "${srcdir}/${pkgname}"-histogram
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
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v --override-ini="filterwarnings=ignore::DeprecationWarning"
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
