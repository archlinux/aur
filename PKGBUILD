# SPDX-License-Identifier: 0BSD
# Maintainer: Emma Welker <code at nuew dot net>
_name=zilliandomizer
pkgname="python-${_name}"
pkgver=0.9.2
pkgrel=1
pkgdesc="A randomizer for Zillion, the 1987 metroidvania for the Sega Master System."
arch=(any)
url="https://github.com/beauxq/zilliandomizer"
license=(AGPL-3.0-only custom)
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-typing_extensions')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${_name}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${_name^^}=${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" pytest "${pytest_options[@]}"
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
