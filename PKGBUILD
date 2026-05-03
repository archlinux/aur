# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=galois
pkgname=python-$_name
pkgver=0.4.11
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
b2sums=('d0d1049ede3da2881fa42bb52be94978e2d07d11c4b7fca8dd06bb5978486a176f427e58aea6ca7ae0251eba23ef4b4cf7739292ac7ce00fadb6d94fd76ac32d')

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
