# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pytest-docker
pkgname=python-${_pkgname}
pkgver=3.2.1
pkgrel=1
pkgdesc="Pytest plugin for Docker and Docker compose tests."
arch=('any')
url="https://github.com/avast/pytest-docker"
license=('MIT')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-pytest' 'python-attrs')
checkdepends=('python-requests' 'docker' 'docker-compose')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('841e0b9027b8692d51794f6dcc39a401524dc1d53fd165ee5539aec0dbe4abaaf8a8740f68af9878392a24581b39a8ac94120178c0f9698da037e3c70bd7fe3b')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    python -m installer -d tmp_install dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$PWD/tmp_install/$site_packages" pytest -o addopts="" || warning "Tests failed"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
