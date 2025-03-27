# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-autograd'
_pkgname='autograd'
pkgver='1.7.0'
pkgrel=2
pkgdesc="Efficiently computes derivatives of numpy code"
url="https://github.com/HIPS/autograd"
depends=('python'
    'python-numpy'
    'python-scipy')
checkdepends=(python-pytest)
makedepends=(python-build python-hatchling python-installer python-setuptools python-wheel)
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "test.patch")
sha256sums=('de743fd368d6df523cd37305dcd171861a9752a144493677d2c9f5a56983ff2f'
            'd9a6f88837277337a989780d149aea3dcdba5f29940315ffd416e42da85de4b4')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p1 -i ../test.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=. pytest tests
}

