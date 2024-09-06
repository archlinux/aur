# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-galois
_name=${pkgname#python-}
pkgver=0.4.2
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
    python-build
    python-installer
    python-setuptools-scm
    python-wheel
)
checkdepends=(
    python-pytest
    python-pytest-benchmark
)
source=($_name-$pkgver.tar.gz::https://github.com/mhostetter/$_name/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('e4fa1ec95f789d0386d9953bb90f10b2e674924f18fb8e8324fb6370d866d1810a10afe0af6c2770e94e24dd977cf25c17cbcd7bc48d3a71c34d4fcaeaf0655b')

build() {
    cd $_name-$pkgver
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd $_name-$pkgver
    python -m installer --destdir=test_dir dist/*.whl
    PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
