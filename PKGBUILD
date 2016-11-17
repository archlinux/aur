# Maintainer: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Frank Siegert < frank.siegert at googlemail dot com >
# Contributor: Scott Lawrence < bytbox at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail dot com >
# Contributor: Sebastian Voecking < voeck at web dot de >

pkgname=root
pkgver=6.08.00
pkgrel=3
pkgdesc='C++ data analysis framework and interpreter from CERN.'
arch=('i686' 'x86_64')
url='http://root.cern.ch'
license=('LGPL2.1')
makedepends=('cmake')
depends=('cfitsio'
'fftw'
'ftgl'
'gl2ps'
'glew'
'graphviz'
'gsl'
'hicolor-icon-theme'
'intel-tbb'
'libafterimage'
'libiodbc'
'libmysqlclient'
'postgresql-libs'
'python'
'sqlite'
'tex-gyre-fonts'  # solve the pixelized font problem as per Arch Wiki
'unixodbc'
'unuran'
'xmlrpc-c'
)
optdepends=('gcc-fortran: Enable the Fortran components of ROOT'
            'tcsh: Legacy CSH support'
)
options=('!emptydirs')
source=("https://root.cern.ch/download/root_v${pkgver}.source.tar.gz"
'JupyROOT_fix.patch'
'root.sh'
'root.xml'
'rootd'
'settings.cmake')
sha256sums=('388b4158c6e5706418031060c52c4e6b89cd8856ba06bf11c550eeb1759615d9'
            'a17309295f998ed826dcbf1b5d04de7ed44d64c35221806c75b775796578783d'
            '9d1f8e7ad923cb5450386edbbce085d258653c0160419cdd6ff154542cc32bd7'
            'b103d46705883590d9e07aafb890ec1150f63dc2ca5f40d67e6ebef49a6d0a32'
            '3c45b03761d5254142710b7004af0077f18efece7c95511910140d0542c8de8a'
            'a8db29f6acf32659daca8de35481b25ed847b2182e6033940f3568f3d1ad22fb')
prepare(){
    cd ${pkgname}-${pkgver}

    # Fix JupyROOT inheritance
    patch -p1 -i ${srcdir}/JupyROOT_fix.patch

    2to3 -w etc/dictpch/makepch.py 2>&1 > /dev/null
}

build() {
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    CFLAGS="${CFLAGS} -pthread" \
    CXXFLAGS="${CXXFLAGS} -pthread" \
    LDFLAGS="${LDFLAGS} -pthread -Wl,--no-undefined" \
    cmake -C ${srcdir}/settings.cmake ${srcdir}/${pkgname}-${pkgver}

    make ${MAKEFLAGS}
}

package() {
    cd ${srcdir}/build

    make DESTDIR=${pkgdir} install

    install -D ${srcdir}/root.sh \
        ${pkgdir}/etc/profile.d/root.sh
    install -D ${srcdir}/rootd \
        ${pkgdir}/etc/rc.d/rootd
    install -D -m644 ${srcdir}/root.xml \
        ${pkgdir}/usr/share/mime/packages/root.xml

    install -D -m644 ${srcdir}/${pkgname}-${pkgver}/build/package/debian/root-system-bin.desktop.in \
        ${pkgdir}/usr/share/applications/root-system-bin.desktop
    # replace @prefix@ with /usr for the desktop
    sed -e 's_@prefix@_/usr_' -i ${pkgdir}/usr/share/applications/root-system-bin.desktop

    # fix python env call
    sed -e 's/@python@/python/' -i ${pkgdir}/usr/lib/root/cmdLineUtils.py

    install -D -m644 ${srcdir}/${pkgname}-${pkgver}/build/package/debian/root-system-bin.png \
        ${pkgdir}/usr/share/icons/hicolor/48x48/apps/root-system-bin.png

    # use a file that pacman can track instead of adding directly to ld.so.conf
    install -d ${pkgdir}/etc/ld.so.conf.d
    echo '/usr/lib/root' > ${pkgdir}/etc/ld.so.conf.d/root.conf

    rm -rf ${pkgdir}/etc/root/daemons
}
