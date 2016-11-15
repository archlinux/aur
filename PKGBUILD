# Maintainer: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Frank Siegert < frank.siegert at googlemail dot com >
# Contributor: Scott Lawrence < bytbox at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail dot com >
# Contributor: Sebastian Voecking < voeck at web dot de >

pkgname=root-extra
_pkgname=root
pkgver=6.08.00
pkgrel=1
provides=('root')
conflicts=('root')
pkgdesc='C++ data analysis framework and interpreter from CERN with extra features enabled.'
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
'pythia'
'python'
'sqlite'
'tex-gyre-fonts'  # solve the pixelized font problem as per Arch Wiki
'unixodbc'
'unuran'
'xmlrpc-c'
'xrootd-abi0'
)
optdepends=('gcc-fortran: Enable the Fortran components of ROOT'
            'tcsh: Legacy CSH support'
)
options=('!emptydirs')
source=("https://root.cern.ch/download/root_v${pkgver}.source.tar.gz"
'root.sh'
'root.xml'
'rootd'
'settings.cmake')
sha256sums=('388b4158c6e5706418031060c52c4e6b89cd8856ba06bf11c550eeb1759615d9'
            '9d1f8e7ad923cb5450386edbbce085d258653c0160419cdd6ff154542cc32bd7'
            'b103d46705883590d9e07aafb890ec1150f63dc2ca5f40d67e6ebef49a6d0a32'
            '6a4ef7b32710d414ee47d16310b77b95e4cf1d3550209cf8a41d38a945d05e5f'
            'e5e236ab8ec21136d97d696648ce8f2448b196f40a2f90bbfd450bc186df94c2')
prepare(){
    cd ${_pkgname}-${pkgver}

    2to3 -w etc/dictpch/makepch.py 2>&1 > /dev/null
}

build() {
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    CXXFLAGS="${CXXFLAGS} -pthread" \
    CFLAGS="${CFLAGS} -pthread" \
    LDFLAGS="${LDFLAGS} -pthread -Wl,--no-undefined" \
    cmake -C ${srcdir}/settings.cmake ${srcdir}/${_pkgname}-${pkgver}

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

    install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/build/package/debian/root-system-bin.desktop.in \
        ${pkgdir}/usr/share/applications/root-system-bin.desktop
    # replace @prefix@ with /usr for the desktop
    sed -e 's_@prefix@_/usr_' -i ${pkgdir}/usr/share/applications/root-system-bin.desktop

    # fix python env call
    sed -e 's/@python@/python/' -i ${pkgdir}/usr/lib/root/cmdLineUtils.py

    install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/build/package/debian/root-system-bin.png \
        ${pkgdir}/usr/share/icons/hicolor/48x48/apps/root-system-bin.png

    # use a file that pacman can track instead of adding directly to ld.so.conf
    install -d ${pkgdir}/etc/ld.so.conf.d
    echo '/usr/lib/root' > ${pkgdir}/etc/ld.so.conf.d/root.conf

    rm -rf ${pkgdir}/etc/root/daemons
}

