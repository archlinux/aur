# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-segno
_name=${pkgname#python-}
pkgdesc="Python QR Code and Micro QR Code encoder"
url="https://segno.readthedocs.io/"

pkgver=1.6.6
pkgrel=3

arch=("any")
license=("BSD-3-Clause")

depends=(
    "python"
)
makedepends=(
    "python-build"
    "python-flit-core"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-pillow"
    "python-pypng"
    "python-pytest"
    "python-pytest-cov"
    "python-qrcode-artistic"
    "pyzbar"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "python-segno-flit.patch"
)
b2sums=(
    "41f3739485bd4177d8d47269b246ac12ff765acec78f088c0329a1b0fa58f86c2fcc4273113ef3743c28df21013abe5abd3449ed7e1802464de7357b9c0af1b4"
    "2d0dd057c8a1f15625dc01f1d973f08d696111f0204adaa01786d9655afb963d7b7b82dc3e728a982c10a70c22b767d3052b618a879b2c7ccf5ca694e85fc66d"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/python-segno-flit.patch"
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check(){
    cd "${srcdir}"/${_name}-${pkgver}
    rm tests/test_plugin.py
    python -m pytest
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
