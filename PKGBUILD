# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-galois
_name=${pkgname#python-}
pkgver=0.4.0
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
b2sums=('2eb344ac75027ab77717babe8ad57ee6a98556dcd5d6505947356929da39b805f813508e2ef8e65e3c1aee2e7e299dfae29c1211939587906c9ca646c742683d')

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
