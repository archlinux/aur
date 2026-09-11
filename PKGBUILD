# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-cmaes
pkgver=0.13.1
pkgrel=1
pkgdesc="Lightweight Covariance Matrix Adaptation Evolution Strategy (CMA-ES) implementation for Python 3"
arch=('any')
url="https://github.com/CyberAgent/cmaes"
license=('MIT')
depends=("python" "python-numpy")
optdepends=("python-scipy: Support for CMA-ES with Margin (CMAwM)"
            "python-torch: for safe CMA-ES features"
            "python-gpytorch: for safe CMA-ES features")
makedepends=("python-build" "python-wheel" "python-installer" "python-setuptools")
checkdepends=("python-hypothesis" "python-pytest")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/CyberAgent/$_name/archive/v$pkgver.tar.gz")
sha256sums=('ca6bffad9bf17ec006e2ddae008bc93d85aed4ff618ac406db0dfa7676a8d3e1')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    rm -rf test-env
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf cmaes
    test-env/bin/python -P -m pytest -o addopts=""
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir "$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
