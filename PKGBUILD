# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-galois
_name=${pkgname#python-}
pkgver=0.0.29
pkgrel=2
pkgdesc="A performant NumPy extension for Galois fields and their applications"
arch=('any')
url="https://github.com/mhostetter/galois"
license=('MIT')
depends=(
    'python-numpy'
    'python-numba>=0.55.2'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-pytest')
source=(
    "${_name}-${pkgver}.tar.gz::https://github.com/mhostetter/${_name}/archive/refs/tags/v${pkgver}.tar.gz"
    "numpy-1.22.patch::https://patch-diff.githubusercontent.com/raw/mhostetter/galois/pull/366.patch"  # Support numpy 1.22
)
b2sums=(
    'c03ccbc720b55fe38cb9fe449a2af1e662db70aef124f3cb446f8d5826941b718e7976d73b4b65cca5ec98a33ad79b0c0fca5be533cc77fe3693eb9215307142'
    '622b2465937b66fd2e94716fdd482e5ff5a2d6c2b5d4a779bdb10240b05a0586c5e7c372b2083b3318064671c6632d6bf5c0340766f6a92c0b173a9c40ba8603'
)

prepare() {
    patch --directory="${srcdir}/${_name}-${pkgver}" --forward --strip=1 --input="${srcdir}/numpy-1.22.patch"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$srcdir/test" dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$srcdir"/test/usr/lib/python${python_version}/site-packages
    rm -r galois
    python -m pytest tests/
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
