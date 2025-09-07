# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=pytest-docker-tools
pkgname=python-${_pkgname}
pkgver=3.1.9
pkgrel=1
pkgdesc="Opionated helpers for creating py.test fixtures for Docker integration and smoke testing environments"
arch=('any')
url="https://github.com/Jc2k/pytest-docker-tools"
license=('MIT')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-pytest' 'python-attrs' 'python-playwright')
checkdepends=('python-requests' 'docker' 'docker-compose')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('efad20c106bae058a5bf4eb7ced202a0018f7a3a20e3dabe9bcf893d2012b0956cbcf055c660767ed9eef607bd753245b31368c76790129888d172daf349d385')

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
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
