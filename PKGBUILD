# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-aenum'
_module='aenum'
pkgver='3.1.16'
pkgrel=1
pkgdesc="Advanced Enumerations (compatible with Python's stdlib Enum)"
url="https://pypi.org/project/aenum"
depends=(python)
checkdepends=()
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('BSD-3-Clause')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethanfurman/aenum/archive/refs/tags/$pkgver.tar.gz")

sha256sums=('4c7a5fb76a04ad8dc0c82b13c4cd858b755c69d16c2060a248bf3380a4d1067e')
prepare() {
    cd "${_module}-${pkgver}"
    rm aenum/_py2.py
}

build() {
    cd "${_module}-${pkgver}"
    python -m build -wnx
}

package() {
    cd "${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm "${pkgdir}/${site_packages}/aenum/test_v3.py"
    install -D -m644 aenum/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "${_module}-${pkgver}"
    python -m aenum.test
}
