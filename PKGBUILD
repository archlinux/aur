# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-torf
pkgver=4.2.6
pkgrel=1
pkgdesc='Python module to create, parse and edit torrent files and magnet links'
arch=('any')
url='https://github.com/rndusr/torf/'
license=('GPL-3.0-or-later')
depends=('python' 'python-flatbencode')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-httpserver' 'python-pytest-mock' 'python-pytest-xdist')
BUILDENV+=('!check')
source=("https://github.com/rndusr/torf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5ddbef64d8660a23370935b442b458018eec7e4fb0c9764db260d7919cd8f1f6')

build() {
    cd "torf-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "torf-${pkgver}"
    pytest --file-counts='1' --piece-counts='1'
}

package() {
    python -m installer --destdir="$pkgdir" "torf-${pkgver}/dist"/*.whl
    
    local _site_pkgs
    _site_pkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    rm -r "${pkgdir}${_site_pkgs}"/{docs,tests}
}
