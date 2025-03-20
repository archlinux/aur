# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-ssh2'
_name='ssh2-python'
pkgver=1.1.2
pkgrel=1
pkgdesc="Python bindings for libssh2"
url="https://github.com/parallel-ssh/ssh2-python/"
depends=(libssh2 python)
makedepends=(cython python-build python-installer python-setuptools python-wheel)
checkdepends=('openssh' 'python-pytest')
license=('LGPL-2.1-only')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ParallelSSH/ssh2-python/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('d911297f22322d39e85144900cccdb5b376492a92e17d1680611344451df4fbb')

build() {
    cd "${_name}-${pkgver}"
    SYSTEM_LIBSSH2=1 python -m build -wn
}

package() {
    cd "${_name}-${pkgver}"
    SYSTEM_LIBSSH2=1 python -m installer --dest="${pkgdir}" dist/*.whl
}

check() {
    cd "${_name}-${pkgver}"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    rm -r ssh2
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest tests
}
