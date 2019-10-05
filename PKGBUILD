# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: shamrok <szamrok at gmail dot com>
#
pkgname="pypar2"
pkgver="1.4"
pkgrel="8"
pkgdesc="Graphical frontend (PyGTK) for the Linux par2 utility"
url="https://pypar2.fingelrest.net"
license=('GPL')
arch=('i686' 'x86_64')
depends=('desktop-file-utils' 'libglade' 'par2cmdline' 'pygtk' 'vte-legacy')

source=("${pkgname}-${pkgver}.tar.gz::${url}/uploads/Main/${pkgname}-${pkgver}.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_1.4-7.debian.tar.xz"
)

sha256sums=('2f9e6476453088bdeaf64239a59568e4c62a53398b818ec34f0c3366731ae3d5'
            '8baef66c4528898ef312601a8d91f86cf7307a3dad90c78503c0d3359a353e06'
)

build() {
    cd "${srcdir}/PyPar2-${pkgver}"

    # python2 fix
    sed -i 's_PYTHON ?= python_PYTHON ?= python2_' Makefile
    for file in $(find . -name '*.py' -print); do
        sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done

    ###  Fixing errors  ###
    cd "${srcdir}/debian/patches"    

    # PyXMLSec fix 
    patch ${srcdir}/PyPar2-1.4/src/prefsManager.py no_pyxml.patch

    # typeToolBox fix
    patch ${srcdir}/PyPar2-1.4/src/typeToolBox.py typeorder.patch
}

package() {
    cd "${srcdir}/PyPar2-${pkgver}"
    make prefix=${pkgdir}/usr install
    rm ${pkgdir}/usr/bin/pypar2
    ln -s /usr/share/pypar2/src/main.py ${pkgdir}/usr/bin/pypar2
}

# vim:set ts=4 sw=4 et syn=sh ft=sh: 
