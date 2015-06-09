# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: shamrok <szamrok at gmail dot com>

pkgname=pypar2
pkgver=1.4
pkgrel=7
pkgdesc="Graphical frontend (PyGTK) for the Linux par2 utility"
url="http://pypar2.silent-blade.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('desktop-file-utils' 'libglade' 'par2cmdline' 'pygtk' 'vte')
install="${pkgname}.install"
source=("http://pypar2.silent-blade.org/uploads/Main/${pkgname}-${pkgver}.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_1.4-7.debian.tar.xz")
md5sums=('d77ea7c0ff88209d994c5723c98d00a5'
         '90908545d62843894b0fc59ddcb2b582')

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
