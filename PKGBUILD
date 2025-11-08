# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=galois
pkgname=python-$_name
pkgver=0.4.7
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
b2sums=('aa1a2d8be1830b7d0466ff8dc61441c4fe33ddeaf121be50d22187d8c8295c2040bfe465f9b46ba9bea11ef4f6dfa0b8a670691ed8879bbeaf1282c1c3dbc493')

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
