# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-liboqs
_name=liboqs-python
pkgver=0.8.0
pkgrel=1
pkgdesc="Python 3 bindings for liboqs"
arch=('any')
url="https://github.com/open-quantum-safe/liboqs-python"
license=('MIT')
depends=('liboqs')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-nose2')
source=("${_name}-${pkgver}.tar.gz::https://github.com/open-quantum-safe/$_name/archive/refs/tags/$pkgver.tar.gz")
b2sums=('b7b19092eccc33804b11e907d7fa69dc42511e7fff6a3026380ac31f2a8c1486222cbbff92e538aafd165e8ace36acb7d055bf42749bf1dc834e7fffb3e457f9')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$srcdir/test" dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$srcdir"/test/usr/lib/python${python_version}/site-packages
    python -m nose2 --verbose
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
