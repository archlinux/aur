# SPDX-License-Identifier: 0BSD
# Maintainer: Emma Welker <code@nuew.net>
_name=dolphin-memory-engine
pkgname="python-${_name}"
pkgver=1.3.0
pkgrel=1
pkgdesc="Python library for hooking to a running Dolphin process"
arch=(x86_64)
url="https://github.com/randovania/py-dolphin-memory-engine"
license=(MIT)
depends=('python')
makedepends=('cython'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f3df89731c5300b292738ef2d0064222fb916afb2344c9acc52deb25c460c8e0')

build() {
    cd "py-${_name}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_$(echo ${_name^^} | tr '-' '_')=${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "py-${_name}-${pkgver}"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" pytest "${pytest_options[@]}"
}

package() {
    cd "py-${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
