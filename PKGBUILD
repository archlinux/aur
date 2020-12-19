# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-pytest-cython'
_pkgname='pytest-cython'
pkgver='0.1.0'
pkgrel=2
pkgdesc="A plugin for testing Cython extension modules."
url="https://github.com/lgpage/pytest-cython"
checkdepends=('cython' 'python-pytest')
depends=()
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "43f3d148738f77f8579caae49f74f8d548d3f0a9.patch")
sha256sums=('90fa7e4e619bababeb433d3ba173a80d20473cce0bf3dce2c0e6f298becf5998'
            '0db1f2b6cd2b909fd0214d14a267a9342a74575ff3aa81ea51d3d997b8e11a61')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -l -p1 -i ../43f3d148738f77f8579caae49f74f8d548d3f0a9.patch
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$_pkgname-${pkgver}/tests"
    pushd example-project > /dev/null
    python setup.py build_ext --inplace --use-cython
    popd > /dev/null
    cd ..
    PY_IGNORE_IMPORTMISMATCH=1 PYTHONPATH=src pytest
}
