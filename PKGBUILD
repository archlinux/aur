# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-ssh2'
_pkgname='ssh2-python'
pkgver=0.27.0
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
sha256sums=('6da1c0331aef63f4a4c6cd27e5cb06bab7dcf311d887e918c6d6d058debb18fe'
            'b328ec97238be0fab6171108666c18f7818de2dea247857851b2356303d65e19')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p1 -i ../fix-tests.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

check() {
    cd "${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py build_ext --inplace
    pytest tests
}
