# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-liboqs
_name=liboqs-python
pkgver=0.10.0
pkgrel=4
pkgdesc="Python 3 bindings for liboqs"
arch=(any)
url=https://github.com/open-quantum-safe/liboqs-python
license=(MIT)
depends=(
    liboqs
    python
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(python-nose2)
source=($_name-$pkgver.tar.gz::https://github.com/open-quantum-safe/$_name/archive/refs/tags/$pkgver.tar.gz)
b2sums=('2a23080616f2699db45fd62f641892dba7a11ed456a7eaa7c1ffe29523f0e5544590e9491eb06736ca589b521ddc2fb248b721eca2293f8cf45d91f93a492c4b')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python -m installer --destdir=../test dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH=../test/usr/lib/python$python_version/site-packages
    python -m nose2 --verbose
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
