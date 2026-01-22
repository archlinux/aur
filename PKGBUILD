# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-nihtest
pkgver=1.10.1
pkgrel=1
pkgdesc='A testing tool for command line utilities'
arch=('any')
url='https://github.com/nih-at/nihtest/'
license=('BSD-3-Clause')
depends=(
    'python'
    'python-dateutil')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
source=("https://github.com/nih-at/nihtest/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4bf6545725eedcf0e0476fbd84350d917142ee993b19c29093fba1a20907a07a')

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
