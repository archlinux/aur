# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-pytest-httpserver
pkgver=1.0.0
pkgrel=1
pkgdesc='Pytest plugin for testing http clients without contacting the real http server'
arch=('any')
url='https://github.com/csernazs/pytest-httpserver/'
license=('MIT')
depends=('python' 'python-werkzeug')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-coverage' 'python-requests')
source=("https://github.com/csernazs/pytest-httpserver/archive/${pkgver}/pytest-httpserver-${pkgver}.tar.gz")
sha256sums=('1004a73d8be4ec034c0f2e691e49468dc8ffe713c2f58cd1d97a502586e8a25a')

build() {
    cd "pytest-httpserver-${pkgver}"
    python setup.py build
}

check() {
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    
    cd "pytest-httpserver-${pkgver}"
    PYTHONHASHSEED='0' python setup.py install --root="$(pwd)/tmp_install" --skip-build --optimize='1'
    PYTHONPATH="$(pwd)/tmp_install/usr/lib/python${_pyver}/site-packages" pytest
}

package() {
    cd "pytest-httpserver-${pkgver}"
    PYTHONHASHSEED='0' python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
