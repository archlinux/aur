# Maintainer: Rippa The Hutt <iacopo.rippa@gmail.com>

pkgname=gresistor3
pkgver=3.2.7
pkgrel=2
pkgdesc="Resistor color code calculator"
arch=('any')
url="https://gresistor.stethewwolf.eu"
license=('LGPL-3.0-or-later')
depends=(
    'gtk3'
    'python'
    'python-cairo'
    'python-gobject'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}::git+https://github.com/stethewwolf/gResistor.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m compileall gresistor3 -f
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # The code expects data files relative to the Python module directory.
    # Install them alongside the package where the code looks for them.
    _sitelib=$(python -c "import sysconfig; print(sysconfig.get_path('purelib'))")

    install -Dm644 gresistor3/gresistor.glade \
        "${pkgdir}/${_sitelib}/gresistor3/share/gresistor/gresistor.glade"

    install -Dm644 gresistor3/pixmaps/48x48/eu.stethewwolf.gresistor.png \
        "${pkgdir}/${_sitelib}/gresistor3/share/gresistor/eu.stethewwolf.gresistor.png"

    # Install license
    install -Dm644 license/lgpl.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/lgpl.txt"
}
