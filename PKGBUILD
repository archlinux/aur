# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=multiset
pkgname=python-${_pkgname}
pkgver=3.0.2
pkgrel=2
pkgdesc="A multiset implementation for python"
arch=('any')
url="https://github.com/wheerd/multiset"
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('babde68ad979e173e0afb6a87b05fc63f536d8a9f4dfc2c817f1237344efc684a7225e0d1ca19163007c43451e9a706db9aa489fa10e5e4ec84d85f15f4b5bf4')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -i -e 's/setuptools_scm\[toml\]>=3\.4,<6/setuptools_scm[toml]>=3\.4/' pyproject.toml
    sed -i -e 's/python_requires = >= 3.7.\*/python_requires = >= 3.7/' setup.cfg
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir=test_dir dist/*.whl
    PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest -v
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
