# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=multiset
pkgname=python-${_pkgname}
pkgver=3.0.1
pkgrel=1
pkgdesc="A multiset implementation for python"
arch=('any')
url="https://github.com/wheerd/multiset"
license=('MIT')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('2ccad28744cebb6b6536fce59f50bddabf65c6ec285eae9740a1b3b386c35b0e5679699bf1af640b9a345fb32218a10360420126afdcddf208da30ec53d7f92f')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -i -e 's/setuptools_scm\[toml\]>=3\.4,<6/setuptools_scm[toml]>=3\.4,<8/' pyproject.toml
    sed -i -e 's/python_requires = >= 3.7.\*/python_requires = >= 3.7/' setup.cfg
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$srcdir/test" dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$srcdir"/test/usr/lib/python${python_version}/site-packages
    python -m pytest -v tests
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
