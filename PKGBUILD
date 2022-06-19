# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-constraint
pkgver=1.4.0
pkgrel=6
pkgdesc="Module implementing support for handling CSPs (Constraint Solving Problems) over finite domain"
arch=('x86_64')
url="https://github.com/python-constraint/python-constraint"
license=('custom:BSD')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('5ada7926f226536a1384bf9a082da41824e46d683ee71a278c50e1e5ca0a21eb3acbde4c0b47d6b48c53864ab4ea47d602fc9acb976423035aee74b0c6f3ed85')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$srcdir/test" dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$srcdir"/test/usr/lib/python${python_version}/site-packages
    rm -r ${pkgname/python-}
    python -m pytest tests/
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    #Delete example folder to avoid conflict files with python-cvxpy
    rm -r "${pkgdir}/usr/lib/python3.10/site-packages/examples"
}
