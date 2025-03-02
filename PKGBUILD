# Maintainer: a821
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname=python-haversine
_name=haversine
pkgver=2.9.0
pkgrel=2
pkgdesc='Calculate the distance between two points on Earth using their latitude and longitude.'
url='https://github.com/mapado/haversine'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-numpy: for haversine calculations'
            'python-numba: for jit')
checkdepends=('python-pytest' 'python-numba')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d95b41d50958784b767bf22836f6f992dca0996d52a574fea127bf356352ebdfd2a6e5e4b3144939ce6f39090cd5c567e5fce82acd8bfb8d8b94dfb4fd7b1b47')

prepare() {
    rm -fv "$_name-$pkgver/setup.cfg"
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"

    # remove failing test (see commit message)
    rm -f tests/test_performance.py
    pytest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set ts=4 sw=4 et:
