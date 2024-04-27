# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torf-cli
pkgver=5.2.0
pkgrel=1
pkgdesc='A tool for creating, reading and editing torrent files'
arch=('any')
url='https://github.com/rndusr/torf-cli/'
license=('GPL-3.0-or-later')
depends=('python' 'python-torf' 'python-pyxdg')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
BUILDENV+=('!check')
source=("https://github.com/rndusr/torf-cli/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('347a541f5b3efc4f092fbbe9c2dba15a94206041328901ded5ad8f35735ebfdd')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}-${pkgver}"
    PYTHONPATH="$(pwd)/build/lib" pytest
}

package() {
    python -m installer --destdir="$pkgdir" "${pkgname}-${pkgver}/dist"/*.whl
    
    local _site_pkgs
    _site_pkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    rm -r "${pkgdir}${_site_pkgs}/tests"
}
