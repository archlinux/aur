# SPDX-License-Identifier: 0BSD
# Maintainer: Emma Welker <code at nuew dot net>
pkgname="python-portpicker"
pkgver=1.6.0
pkgrel=1
pkgdesc="A module to find available network ports for testing."
arch=(any)
url="https://github.com/google/python_portpicker"
license=(Apache-2.0)
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
checkdepends=('net-tools' 'python-psutil' 'python-pytest')
optdepends=('python-psutil: portserver')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'portserver.patch')
sha256sums=('9d236d7fcc8e37c00a9281b9bd765d50a6352e71746ea6c36e16c179615785d3'
            '64aa766948a8201a2d69a379715555b07eed360548d337a226c5dad02e3aebca')

prepare() {
    cd "${pkgname/-/_}-${pkgver}"
    patch -p1 -i ../portserver.patch
}

build() {
    cd "${pkgname/-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname/-/_}-${pkgver}"
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="${PWD}/build/lib:${PWD}/build/scripts-${python_version}" pytest "${pytest_options[@]}"
}

package() {
    cd "${pkgname/-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
