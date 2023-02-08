# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-ginga
_pyname=${pkgname#python-}
pkgver=4.0.1
pkgrel=1
pkgdesc="A viewer for astronomical data FITS (Flexible Image Transport System) files."
arch=('any')
url="https://ejeschke.github.io/ginga"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest-astropy-header'
              'python-photutils'
              'python-pillow'
              'python-scipy'
              'python-astlib'
              'python-starlink-pyast')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4fb8b5ba37dbf9fa52f57da0fe4fdd96')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/ignore:distutils/a \	ignore:the imp module is deprecated:DeprecationWarning" setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv --color=yes -Wdefault
}

package() {
    depends=('python-astropy>=3.2'
             'python-qtpy>=2.0.1'
             'python-pillow>=6.2.1'
             'python-importlib-metadata')
    optdepends=('python-scipy>=0.18.1: required by Pick, some built-in auto cuts algorithms used when you load an image'
                'python-matplotlib>=2.1: required by Pick, Cuts, Histogram, LineProfile'
                'python-opencv>=4.5.4.58: speeds up rotation, mosaicing and some transformations'
                'python-exifread>=2.3.2: recommended'
                'python-beautifulsoup4>=4.3.2'
                'python-astroquery>=0.3.5: required by Catalogs'
                'python-docutils: to display help for plugins'
                'python-photutils'
                'python-fitsio: for opening FITS files'
                'python-astlib: for WCS resolution'
                'python-starlink-pyast: for WCS resolution'
                'python-cairo: for gtk3 backend'
                'python-gobject: for gtk3 backend'
                'python-pyqt5: for qt5 backend'
                'python-aggdraw: for tk backend'
                'python-tornado: for web backend'
                'python-ginga-doc: Documentation for Python-ASDF')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/applications/${pkgname}" ${_pyname}.desktop
    install -d -m644 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m644 ${_pyname}/icons/${_pyname}.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pyname}.svg"
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
