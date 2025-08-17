# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-ginga
_pyname=${pkgname#python-}
pkgver=5.4.0
pkgrel=1
pkgdesc="A viewer for astronomical data FITS (Flexible Image Transport System) files."
arch=('any')
url="https://ejeschke.github.io/ginga"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-pytest-astropy-header'
#             'python-pytest-xdist'
              'python-photutils'
              'python-puremagic'
              'python-regions'
              'python-astlib')  # pillow <- matplotlib <- astlib, scipy required by astlib, photutils
#             'python-starlink-pyast'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d3441689a9fa53961fcfe98f667b6fe3')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    sed -i "/ignore:distutils/a \	ignore:the imp module is deprecated:DeprecationWarning" setup.cfg
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #-Wdefault
}

package() {
    depends=('python-astropy>=6.0.1'
             'python-qtpy>=2.4.1'
             'python-pillow>=11.1.0'
             'python-puremagic>=1.28'
             'python-yaml>=6.0'
             'python-packaging>=23.1'
             'hicolor-icon-theme')
    optdepends=('python-scipy>=0.18.1: required by Pick, some built-in auto cuts algorithms used when you load an image'
                'python-matplotlib>=3.8: required by Pick, Cuts, Histogram, LineProfile'
                'python-magic>=0.4.15: aids in identifying files when opening them'
                'python-opencv>=4.5.4.58: speeds up rotation, mosaicing and some transformations'
                'python-exifread>=2.3.2: recommended'
                'python-beautifulsoup4>=4.3.2'
                'python-astroquery>=0.3.5: required by Catalogs'
                'python-dateutil: to display help for plugins'
                'python-photutils'
                'python-fitsio: for opening FITS files'
                'python-astlib: for WCS resolution'
                'python-starlink-pyast: for WCS resolution'
                'python-cairo: for gtk3, web, tk backend'
                'python-gobject: for gtk3 backend'
                'python-pyqt5: for qt5 backend'
                'python-pyqt6: for qt6 backend'
                'pyside2: for pyside2 backend'
                'pyside6: for pyside6 backend'
                'python-tornado: for web backend'
                'python-ginga-doc: Documentation for Python-ASDF')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/applications/${pkgname}" ${_pyname}.desktop
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m644 ${_pyname}/icons/${_pyname}.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pyname}.svg"
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
