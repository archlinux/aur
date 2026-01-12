# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=python-zenlib
_name=${pkgname#python-}
pkgver=3.1.5
pkgrel=4
pkgdesc='Useful python decorators and utilities'
arch=(any)
url="https://github.com/desultory/$_name"
license=(GPL-2.0-only)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'skip-test-python314.patch')
b2sums=('900cc0dbdb087d0d294027747eed046dee452ac7dd15cb572ff769e148e07478a5030f8412fdbebcf89db17c6e06df5368fe28ff1df983723e068b9005cba6ce'
        'ec784569067e545eaf01abae5abd9cad2e71dee22b883b593726dd5dfe59e68c9c261730ac67590ac8f4ee415b61cec37374583ec4ba36bfb191ecf59f20aee4')

prepare() {
    cd $_name-$pkgver
    # Skip test_bad_type which fails on Python 3.14 due to annotation handling changes
    patch -Np1 -i "$srcdir/skip-test-python314.patch"
}

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    rm -rf test-env
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    CI=true test-env/bin/python -P -m unittest discover tests -v
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
