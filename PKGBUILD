# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-galois
_name=${pkgname#python-}
pkgver=0.3.4
pkgrel=1
pkgdesc="A performant NumPy extension for Galois fields and their applications"
arch=('any')
url="https://github.com/mhostetter/galois"
license=('MIT')
depends=(
    'python-numpy'
    'python-numba'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-pytest-benchmark'
)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('d6b9668a842b75571a084087eb505bde5bc01197a9c2e26f0ace080f3f32a9f0360a2c28f47f8ea32abc3578200ca106b1aca6f308aeb4f1ca8e8646647aeec1')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$srcdir/test" dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$srcdir"/test/usr/lib/python${python_version}/site-packages
    python -m pytest -v tests
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
