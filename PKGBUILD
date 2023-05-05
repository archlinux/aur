# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-ssh2'
_pkgname='ssh2-python'
pkgver=1.0.0
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
sha256sums=('70c6b6efd8ca9f8de9c2d77e7cb1d5859542588347ea426d6822b0ffd9889af3'
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
