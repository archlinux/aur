# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
_name=duet
pkgname=python-$_name
pkgver=0.2.9
pkgrel=1
pkgdesc="A simple future-based async library for python"
arch=(any)
url=https://github.com/google/duet
license=(Apache-2.0)
depends=(python)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(python-pytest)
source=($_name::git+https://github.com/google/duet#tag=v$pkgver)
b2sums=('4d8063b932cc077184fe294081001e55c77b22374d06a83d46f8541b0839238c156c759723dbff2e214bc5e592b555c819f5159bcb534b2b6ccbe4ffeb6aeea2')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" pytest -v duet
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
