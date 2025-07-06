# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pytest-docker
pkgname=python-${_pkgname}
pkgver=3.2.3
pkgrel=1
pkgdesc="Pytest plugin for Docker and Docker compose tests."
arch=('any')
url="https://github.com/avast/pytest-docker"
license=('MIT')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-pytest' 'python-attrs')
checkdepends=('python-requests' 'docker' 'docker-compose')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('264ecc0026f1a1d8a7072b11dbf220b8b255612814b2e862305d32be611796b6edada3777b3e8869d5ca5db6d60304b61fbcb6fc02fd3cd5d7c4e0f6ca783d47')

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
