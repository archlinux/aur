# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC1091,SC2034,SC2154,SC2164

_name=mapbox_earcut_python

pkgname=python-mapbox-earcut
pkgver=1.0.2
pkgrel=1
pkgdesc="Python bindings for the C++ implementation of the Mapbox Earcut library."

arch=("x86_64")
license=("ISC")
url="https://github.com/skogler/mapbox_earcut_python"

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('5d5a4ceebc2cd7cd6492253445ac1f0cb5d0435d58fd0b08c4d4ba7e33643bdfd4d7db5171eac3ae4ece678957cee61c4c09fd4af0ab8fa500681493bfa36894')

depends=(
    "python"
)
makedepends=(
    "pybind11"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-virtualenv"
)

build () {
    cd "$srcdir/$_name-$pkgver" || exit
    python -m build --wheel --no-isolation
}

check () {
    cd "$srcdir/$_name-$pkgver"

    python -m venv venv
    (
        source venv/bin/activate
        pip install ./dist/*.whl pytest
        python -m pytest
    )
    rm -rf venv
}

package () {
    cd "$srcdir/$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
