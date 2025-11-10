# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Tomislav Ivek <tomislav dot ivek at gmail dot com>

pkgname=python-patch-ng
pkgver=1.19.0
pkgrel=1
pkgdesc='Python library to parse and apply unified diffs (new generation)'
arch=('any')
url='https://github.com/conan-io/python-patch-ng/'
license=('MIT')
depends=(
    'python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
source=("https://github.com/conan-io/python-patch-ng/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('19be239070b96224ff5d95de5be3c010610361cdc92af8634588f8c98686ef08')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}-${pkgver}/tests"
    ./run_tests.py
}

package() {
    python -m installer --destdir="$pkgdir" "${pkgname}-${pkgver}/dist"/*.whl
    
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sr "${pkgdir}${_sitepkgs}/patch_ng-${pkgver}.dist-info/licenses/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
