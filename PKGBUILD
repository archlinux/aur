# Maintainer: quietvoid <tcChlisop0@gmail.com>

_libname=pybind11-rdp
pkgname="python-${_libname}"
pkgver=v0.1.4
pkgrel=1
pkgdesc='C++ implementation of the Ramer-Douglas-Peucker algorithm (binding to python via pybind11)'
_rootdir="${_libname}-${pkgver}"
arch=('x86_64')
url='https://github.com/cubao/pybind11-rdp'
license=('BSD')
depends=('pybind11')
makedepends=('git' 'cmake' 'python-build' 'python-installer' 'python-wheel')
provides=('python-pybind11-rdp')
conflicts=('python-pybind11-rdp')
source=("${_rootdir}::git+https://github.com/cubao/pybind11-rdp.git#tag=${pkgver}"
        '010-pybind11-rdp-remove-unwanted-pip-build-deps.patch')
sha256sums=('SKIP'
            'f48ac993fadc956bae9e095209f4ed61124a3e1e6c1560b85a0ced4acf1a51f1')

prepare() {
    cd "${_rootdir}"
    patch -Np1 -i "${srcdir}/010-pybind11-rdp-remove-unwanted-pip-build-deps.patch"

    git submodule update --init --recursive
}

build() {
    cd "${_rootdir}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
