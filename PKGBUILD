# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=multiset
pkgname=python-${_pkgname}
pkgver=3.2.0
pkgrel=3
pkgdesc="A multiset implementation for python"
arch=(any)
url=https://github.com/wheerd/multiset
license=(MIT)
depends=(python)
makedepends=(
    python-build
    python-installer
    python-setuptools-scm
    python-wheel
)
checkdepends=(python-pytest)
source=($_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=('1d0acbebb157734bc20ad14edfd6be7cc16fc387c45fed49acaef60fa480fff320b8d8d889cb164ee2e1a87a21d2bff85db14691ec41e534005f837d12e679f5')

build() {
    cd $_pkgname-$pkgver
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd $_pkgname-$pkgver
    python -m installer --destdir=test_dir dist/*.whl
    PYTHONPATH=test_dir/$_site_packages:$PYTHONPATH pytest
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
