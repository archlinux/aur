# SPDX-License-Identifier: 0BSD
# Maintainer: Emma Welker <code at nuew dot net>
_name=setuptools-cmake-helper
pkgname="python-${_name}"
pkgver=0.2.1
pkgrel=1
pkgdesc="Simpler helper to build a Python C/C++ Extension using CMake"
arch=(any)
url="https://github.com/henriquegemignani/setuptools-cmake-helper"
license=(Apache-2.0)
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${_name}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_$(echo ${_name^^} | tr '-' '_')=${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="${PWD}/build/lib" pytest "${pytest_options[@]}"
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
