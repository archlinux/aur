# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-nihtest
pkgver=1.11.1
pkgrel=1
pkgdesc='A testing tool for command line utilities'
arch=('any')
url='https://github.com/nih-at/nihtest/'
license=('BSD-3-Clause')
depends=(
    'python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
source=("https://github.com/nih-at/nihtest/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0ed23b2238a80870557e3d13b72efa179c6cf71531c0618711e0bc82442015bc')

build() {
    cd "nihtest-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "nihtest-${pkgver}/dist"/*.whl
    install -D -m644 "nihtest-${pkgver}/manpages/nihtest.man" "${pkgdir}/usr/share/man/man1/nihtest.1"
    install -D -m644 "nihtest-${pkgver}/manpages/nihtest.conf.man" "${pkgdir}/usr/share/man/man5/nihtest.conf.5"
    install -D -m644 "nihtest-${pkgver}/manpages/nihtest-case.man" "${pkgdir}/usr/share/man/man5/nihtest-case.5"
    
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sr "${pkgdir}${_sitepkgs}/nihtest-${pkgver}.dist-info/licenses/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
