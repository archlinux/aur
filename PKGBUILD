# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=libeconf
pkgname="python-${_pkgname}"
pkgver=0.8.7
pkgrel=1
pkgdesc='Python bindings for libeconf'
url="https://github.com/openSUSE/${_pkgname}"
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
    # Python build system
    'python-build'
    'python-installer'
    'python-wheel'
    # Upstream build system
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    "${_pkgname}"
)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('1572f941ba12334df1aa7b86582c79fdb604434bc27307d36b597ed4d7bbbeda27d753d4a5c07591989b5645f281afa63352018037279995fbf705f0d30d2b6a')

_srcdir="${_pkgname}-${pkgver}/bindings/python3"

build() {
    cd "${_srcdir}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_srcdir}"
    PYTHONPATH="${_srcdir}:${PYTHONPATH}" pytest
}

package() {
    # libeconf is not needed for building, but is needed to run/use it
    depends+=("${_pkgname}")

    pushd "${_srcdir}"
        python -m installer --destdir="${pkgdir}" dist/*.whl
        install -Dm644 docs/python-libeconf.3 "${pkgdir}"/usr/share/man/man3/python-libeconf.3
    popd

    cd "${_pkgname}-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md TODO.md NEWS
}
