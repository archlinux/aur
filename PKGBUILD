# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-cmaes
pkgver=0.12.0
pkgrel=1
pkgdesc="Lightweight Covariance Matrix Adaptation Evolution Strategy (CMA-ES) implementation for Python 3"
arch=('any')
url="https://github.com/CyberAgent/cmaes"
license=('MIT')
depends=("python" "python-numpy")
optdepends=("python-scipy: Support for CMA-ES with Margin (CMAwM)")
makedepends=("python-wheel" "python-installer" "python-setuptools")
checkdepends=("python-hypothesis" "python-pytest")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/CyberAgent/$_name/archive/v$pkgver.tar.gz")
sha256sums=('61c0b7ae06e4a92c3759765418ea30aaf51511f440377c3bbc81bd75f7c7e89f')

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
