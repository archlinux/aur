# Maintainer: morguldir <morguldir@protonmail.com>
# Maintainer: is1 <is1@sdf.org>

pkgname=python-yappi
pkgver=1.6.0
pkgrel=1
pkgdesc='A tracing profiler that is multithreading, asyncio and gevent aware.'
url='https://github.com/sumerc/yappi'
license=(MIT)
arch=('x86_64')
depends=(python)
optdepends=(python-greenlet)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-installer python-pytest python-gevent)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/sumerc/yappi/archive/refs/tags/$pkgver.tar.gz"
        "pyproject.toml.add-console-script.patch")
sha256sums=('c810188f1b2746e56b80f86947e0274dce558a051d2a0177ea329d6eb6e1ec39'
            'be24dc0b60e08a18f5d1e8d55d7593b5d1920733a2c951af677dd6d498585b01')

prepare() {
    cd yappi-"$pkgver"
    patch -p1 -i ../pyproject.toml.add-console-script.patch pyproject.toml
}

build() {
    cd yappi-"$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd yappi-"$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
    cd yappi-"$pkgver"
    # This is done to generate the yappi console script in check/usr/bin
    python -m installer --destdir check dist/*.whl
    local libdir="$(find "$PWD"/check -name yappi.py -exec dirname '{}' ';')"
    local bindir="$PWD/check/usr/bin"
    export PYTHONPATH="$libdir:$PWD/tests"
    export PATH="$bindir:$PATH"
    pytest
}
