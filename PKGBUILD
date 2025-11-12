# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pytest-docker
pkgname=python-${_pkgname}
pkgver=3.2.5
pkgrel=1
pkgdesc="Pytest plugin for Docker and Docker compose tests."
arch=('any')
url="https://github.com/avast/pytest-docker"
license=('MIT')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-pytest' 'python-attrs')
checkdepends=('python-requests' 'docker' 'docker-compose')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('7e5de99aac72f0070be4af4e2be6d158dcc652262433bdbd6fc9397c54edf4636b7501842787f3859536142dd565f777e695a3e4a31e8d6459415166b0dc147f')

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
