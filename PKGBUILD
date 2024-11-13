pkgname='python-randomgen'
_pkgname='randomgen'
pkgver='2.1.1'
pkgrel=1
pkgdesc="Numpy-compatible bit generators and random variates distributions"
url="http://github.com/bashtage/randomgen"
depends=('python' 'python-numpy')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest')
license=('BSD-3-Clause')
arch=('x86_64')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('2f402afff92d2025e0a054bd5aa3069bed476951f18a5476c715cb695f3c418b')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir=test_dir dist/*.whl
    pytest "test_dir/$site_packages/randomgen"
}
