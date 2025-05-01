# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=galois
pkgname=python-$_name
pkgver=0.4.6
pkgrel=1
pkgdesc="A performant NumPy extension for Galois fields and their applications"
arch=(any)
url=https://github.com/mhostetter/galois
license=(MIT)
depends=(
    python-numpy
    python-numba
    python-typing_extensions
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools-scm
    python-wheel
)
checkdepends=(
    python-pytest
    python-pytest-benchmark
)
source=($_name::git+https://github.com/mhostetter/$_name#tag=v$pkgver)
b2sums=('e98b71597242f353349f1423842b31b8f5fc86e08bf33e257e1c5dc679537f65ba2a64c8d6309609b6275b97cc2ea0ae71cc6ca24d4cb4575e8c72fbfd7054ff')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    rm -rf src
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" pytest
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
