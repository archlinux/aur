# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-chex
_pkgname=${pkgname#python-}
pkgver=0.1.90
pkgrel=1
pkgdesc="A library of utilities for helping to write reliable JAX code"
arch=('any')
url="https://github.com/google-deepmind/chex"
license=('Apache-2.0')
groups=('deepmind' 'jax')
depends=('python-absl'
         'python-jax>=0.4.27'
         'python-numpy'
         'python-toolz'
         'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-cloudpickle' 'python-dm-tree' 'python-pytest')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/google-deepmind/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'chex.diff')
sha256sums=('1cb299491c29d2311939a242919b79c347f5a11ba605fca86a11a55cf3a0aa46'
            'SKIP')

prepare() {
    cd "$_pkgname-$pkgver"
    # There is no dependency on `dm-tree` in `chex`.
    sed -i '/\(dm[-_]tree\|setuptools\)/d' requirements/requirements.txt
    # https://github.com/google-deepmind/chex/issues/347
    patch -p1 -i../chex.diff
}

build() {
    python -m build -nw "$_pkgname-$pkgver"
}

check() {
    cd "$_pkgname-$pkgver"
    export PYTHONPATH=$PWD
    pytest -v -s chex
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*.whl
}
