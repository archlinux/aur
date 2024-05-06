# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=multiset
pkgname=python-${_pkgname}
pkgver=3.1.0
pkgrel=2
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
b2sums=('74b49e08e6b3d26169975229ba06db6c9d15066976ff35af40ba7d984d5e5c253e565dbb7fe1acfd8773de5c1de26d3f8a04a68b6516882faf8efb032652883a')

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
