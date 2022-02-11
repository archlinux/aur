# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-pytest-httpserver
pkgver=1.0.4
pkgrel=1
pkgdesc='Pytest plugin for testing http clients without contacting the real http server'
arch=('any')
url='https://github.com/csernazs/pytest-httpserver/'
license=('MIT')
depends=('python' 'python-werkzeug')
makedepends=('python-setuptools' 'python-pip' 'python-poetry' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-coverage' 'python-requests')
conflicts=('python-pytest-localserver')
source=("https://github.com/csernazs/pytest-httpserver/archive/${pkgver}/pytest-httpserver-${pkgver}.tar.gz")
sha256sums=('164ec7aa21b776d441bdb2fddb85b92a8a0a0cd7ad5d1d5210430d23b2624a4d')

build() {
    cd "pytest-httpserver-${pkgver}"
    poetry build -f sdist
    bsdtar -x -f "dist/pytest_httpserver-${pkgver}.tar.gz" -C .
    cd "pytest_httpserver-${pkgver}"
    python setup.py build
}

check() {
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    
    cd "pytest-httpserver-${pkgver}/pytest_httpserver-${pkgver}"
    python setup.py install --root="$(pwd)/tmp_install" --skip-build --optimize='1'
    PYTHONPATH="$(pwd)/tmp_install/usr/lib/python${_pyver}/site-packages" pytest
    PYTHONPATH="$(pwd)/tmp_install/usr/lib/python${_pyver}/site-packages" pytest --ssl
}

package() {
    cd "pytest-httpserver-${pkgver}/pytest_httpserver-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
