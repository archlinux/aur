# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=pytest-docker
pkgname=python-${_pkgname}
pkgver=3.2.2
pkgrel=1
pkgdesc="Pytest plugin for Docker and Docker compose tests."
arch=('any')
url="https://github.com/avast/pytest-docker"
license=('MIT')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-pytest' 'python-attrs')
checkdepends=('python-requests' 'docker' 'docker-compose')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('cea73dd6bd6fcdcffc8f38999a798b670585f7b654f4ad8723e908e11c3e6ce7f83950d037da93460ea38f805bd946782e49cb94c2f8ad73b9916d43e87c215c')

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
