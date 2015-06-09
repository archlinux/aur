# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

_pkgname="updf"
pkgname="${_pkgname}-bzr"
pkgver=17
pkgrel=7
pkgdesc='A tool to write and paint to an existing pdf file. uPdf can insert pages of another pdf, insert new pages, remove and extract pages, rotate pages, paste an image in the existing pdf, and much more.'
arch=('i686' 'x86_64')
url='https://launchpad.net/updf/'
license=('GPL3')
depends=('gtk3' 'python2' 'python2-cairo' 'python2-numpy' 'python2-polib' 'poppler-glib' 'libappindicator-gtk3')
makedepends=('bzr' 'python2-distutils-extra')
install="${pkgname}.install"
provides=("${_pkgname}")
source=("${_pkgname}::bzr+http://bazaar.launchpad.net/~lorenzo-carbonell/${_pkgname}/trunk-1/")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    bzr revno
}

build() {
    # Fix Bug #1180103
    # https://bugs.launchpad.net/updf/+bug/1180103/comments/2
    cd "${srcdir}/${_pkgname}"
    sed -i '238d' ./src/updf.py    # toolbar.set_property("toolbar_style",'icons')
    sed -i '354d' ./src/updf.py    # toolbar2.set_property("toolbar_style",'icons')

    export PYTHON="/usr/bin/python2"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    mkdir -p ${pkgdir}/usr/share    
    mv ./locale-langpack ${pkgdir}/usr/share/locale

    cd "${srcdir}/${_pkgname}/data"
    mkdir -p ${pkgdir}/usr/share/applications
    mv updf.desktop ${pkgdir}/usr/share/applications
    rm page_formats.ods
    mkdir -p ${pkgdir}/usr/share/updf
    mv * ${pkgdir}/usr/share/updf

    cd "${srcdir}/${_pkgname}/src"
    sed -i 's|/usr/bin/python$|/usr/bin/python2|' *.py
    mv * ${pkgdir}/usr/share/updf

    cd "${srcdir}/${_pkgname}/bin"
    sed -i 's|#!/usr/bin/python$|#!/usr/bin/python2|' updf 
    mkdir -p ${pkgdir}/usr/bin
    install -m755 updf ${pkgdir}/usr/bin
}
