# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-ssh2'
_pkgname='ssh2-python'
pkgver=0.26.0
pkgrel=1
pkgdesc="Python bindings for libssh2"
url="https://github.com/ParallelSSH/ssh2-python/"
depends=('libssh2')
makedepends=('python-setuptools' 'cython')
checkdepends=('openssh' 'python-pytest')
license=('GPL')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ParallelSSH/$_pkgname/archive/$pkgver.tar.gz"
    "fix-tests.patch")
sha256sums=('38912993a9d63f8ec6f137d04c8eff1c840bb4b4801260a5b686e50ab57c86e7'
            '49c6c5d2021db7a7ae5d81b7f34abd16bef06e8112d72b17a86eb8760d339f57')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p0 -i ../fix-tests.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py build_ext
}

package() {
    cd "${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py build_ext --inplace
    pytest tests
}
