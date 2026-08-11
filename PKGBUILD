# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=python-borghash
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='A memory-efficient hashtable with serialization'
arch=(x86_64)
url=https://github.com/borgbackup/$_name
license=(BSD-3-Clause)
depends=(glibc python)
makedepends=(cython
             git
             python-build
             python-installer
             python-setuptools
             python-setuptools-scm)
checkdepends=(python-pytest python-pytest-benchmark)
source=(git+$url.git#tag=$pkgver?signed)
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>
b2sums=('8f6cf8b322cc7ad728b0cc33c57f580387a579e46584eac192c0cb203afc87b483fa529abf6c2581884f20348ab66da6ea98664b3c8cab37679ea44cecc17d2d')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 CHANGES.rst -t "$pkgdir/usr/share/doc/$pkgname"
}
