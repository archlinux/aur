# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-aenum'
_module='aenum'
pkgver='3.1.15'
pkgrel=1
pkgdesc="Advanced Enumerations (compatible with Python's stdlib Enum)"
url="https://pypi.org/project/aenum"
depends=(python)
checkdepends=()
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('BSD-3-Clause')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-${pkgver}.tar.gz"
   https://patch-diff.githubusercontent.com/raw/ethanfurman/aenum/pull/36.patch
   https://raw.githubusercontent.com/ethanfurman/aenum/master/aenum/test_v37.py)

sha256sums=('8cbd76cd18c4f870ff39b24284d3ea028fbe8731a58df3aa581e434c575b9559'
            '9151a5147b8d72bda40f62078d0780bb6926a045137f6bcd7137ef04a051a649'
            '666be366ac8b8089d005581cdddfd8acef1b73d61b01c53d5fe079daa7cc8325')

prepare() {
    cd "${_module}-${pkgver}"
    patch -p1 < ../36.patch
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
    cp ../test_v37.py aenum/
    python -m aenum.test
}
