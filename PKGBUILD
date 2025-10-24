# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: morguldir <morguldir@protonmail.com>
# Contributor: is1 <is1@sdf.org>

pkgname=python-yappi
pkgver=1.7.3
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
sha256sums=('46e2a82bbd0c60c6b4f3fe3a58c9983ec04e7fdb715c0937f7d5a52e6e111f7f'
            'afd256f3d0bf9651739e26fb5003572beea9b0029cd4d1cadf5cd0523440ae46')

prepare() {
    cd yappi-"$pkgver"

    patch -p1 -i ../pyproject.toml.add-console-script.patch pyproject.toml
}

build() {
    cd yappi-"$pkgver"

    python -m build --wheel --no-isolation
}

# check() {
#     cd yappi-"$pkgver"
#
#    # This is done to generate the yappi console script in check/usr/bin
#     python -m installer --destdir check dist/*.whl
#     local libdir="$(find "$PWD"/check -name yappi.py -exec dirname '{}' ';')"
#     local bindir="$PWD/check/usr/bin"
#     export PYTHONPATH="$libdir:$PWD/tests"
#     export PATH="$bindir:$PATH"
#     pytest
# }

package() {
    cd yappi-"$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
