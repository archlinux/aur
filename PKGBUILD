# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=python-borghash
_name=${pkgname#python-}
pkgver=0.2.1
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
b2sums=('b7b01e96782312c59ebbd4652250987c20b2b4d028ffc673259a13633a0650b3d6155e9d87e69a0a9312ffd539a82faef7665339a0cc32310a5eb5f309352746')

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
