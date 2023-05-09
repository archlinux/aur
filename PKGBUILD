 # Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=tweedledum
pkgname=python-${_pkgname}-git
pkgver=r263.9d3a2fab
pkgrel=1
pkgdesc="A library for synthesizing and manipulating quantum circuits"
arch=('x86_64')
url="https://github.com/boschmitt/tweedledum"
license=('MIT')
makedepends=(
    'cmake'
    'git'
    'ninja'
    'nlohmann-json'
    'python-scikit-build'
    'python-setuptools'
)
provides=('python-tweedledum')
conflicts=('python-tweedledum')
source=(
    "git+https://github.com/boschmitt/${_pkgname}.git"
    "pybind11.tar.gz::https://github.com/pybind/pybind11/archive/refs/tags/v2.10.4.tar.gz"
)
b2sums=(
    'SKIP'
    '7b2d86e8262581b2cc6dd720b83336206e242ef8ca99b257b01a11141ed8b127d7f35d7d573bc763dd36f2fe8c8ac91766089deb63a76e9c10029c34eec2d6d3'
)


pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Update external/pybind11 to a recent version
    # https://github.com/boschmitt/tweedledum/issues/181
    cd "${srcdir}/${_pkgname}/external"
    rm -r pybind11
    mv "${srcdir}/pybind11-2.10.4" pybind11

    # Fix for gcc 13
    cd "${srcdir}/${_pkgname}"
    cd include/tweedledum/IR
    sed -i '6s/.*/#include <cstdint>/' Cbit.h
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
