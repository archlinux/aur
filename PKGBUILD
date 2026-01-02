# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=galois
pkgname=python-$_name
pkgver=0.4.10
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
b2sums=('de7645f5efe43c8e6fa53d6b8f160e1d97de59a2878b8d9bcf1b3260aaca92b48033a89311f1f7814fd33a852ca2f1dc06cf4b42a255acf1c996eaa2cdab5abf')

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
