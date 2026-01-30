# SPDX-License-Identifier: 0BSD
# Maintainer: Emma Welker <code at nuew dot net>
_name=mpyq
pkgname="python-${_name}"
pkgver=0.2.5
pkgrel=1
pkgdesc="Python library for reading MPQ archives."
arch=(any)
url="https://github.com/eagleflo/mpyq"
license=(BSD-2-Clause)
depends=('python-six')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        test_mpqarchive.patch)
sha256sums=('1d9191738ea219e04e51ec4e9da4984db40f50c503c902249398ac7066b970cd'
            '840f0437aba4c8a35ce8796cc719db864fc7cc6bbe16b822956301220ea937d3')

prepare() {
    cd "${_name}-${pkgver}"
    patch -p1 -i ../test_mpqarchive.patch
}

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}"
    PYTHONPATH="${PWD}/build/lib" python -m unittest discover
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
