# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-liboqs
_name=liboqs-python
pkgver=0.12.0
pkgrel=1
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
b2sums=('efeaf5454eef143a746af308fe2649cba5ddf32e2d5535beffacc0783bc03956f046a2c2f51e08f4af8122d063b3946c2c6746ff4d938cb5708a3bd90674f26c')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python -m installer --destdir=../test dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH=../test/usr/lib/python$python_version/site-packages
    rm -r oqs
    python -m nose2 --verbose
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
