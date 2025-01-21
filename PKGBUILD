# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=galois
pkgname=python-$_name
pkgver=0.4.4
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
b2sums=('1dc8a0686604e7758eca28415cb9a1553b0e4e4ddd3b53041f0dd307019cc7e3a63f6b657cb1ab1650c5d875992d3b2e00ff93619035af8f5b4fec4f9b7226f0')

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
