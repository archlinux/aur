# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-formulaic'
_pkgname='formulaic'
pkgver='0.5.2'
pkgrel=2
pkgdesc="A high performance of Wilkinson formulas in Pythonn"
url="https://github.com/matthewwardrop/formulaic"
depends=(python
    python-astor
    python-interface-meta
    python-numpy
    python-pandas
    python-scipy
    python-typing_extensions
    python-wrapt)
checkdepends=(python-pytest python-sympy)
optdepends=(python-pyarrow python-sympy)
makedepends=(python-build python-hatch-vcs python-hatchling python-installer python-wheel)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "pytest_7_bugfix.patch::https://github.com/matthewwardrop/formulaic/commit/e5dedcb0feed39f5ff6e2326d727ca65d247f26d.patch")
sha256sums=('25b1e1c8dff73f0b11c0028a6ab350222de6bbc47b316ccb770cec16189cef53'
            '906ce378642dcc329f25266f7e76c0ec9c94ebb67a3ffb11c43b349872ec9669')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p1 < ../pytest_7_bugfix.patch || return 0
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation

}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=. pytest tests
}
