# Maintainer:  Konstantin Gizdov < arch at kge dot pw >
# Contributor: Carl Lei < xecycle at gmail dot com >
# Contributor: Scott Lawrence < bytbox at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail dot com >
# Contributor: Sebastian Voecking < voeck at web dot de >

pkgname=root5
pkgver=5.34.38
pkgrel=2
pkgdesc='C++ data analysis framework and interpreter from CERN'
arch=('i686' 'x86_64')
url='https://root.cern.ch'
license=('LGPL2.1')
provides=('root')
conflicts=('root')
makedepends=('gcc-fortran'
             'pythia8'
             'xrootd')
depends=('cfitsio'
         'fftw'
         'ftgl'
         'giflib'
         'glew'
         'graphviz'
         'gsl'
         'hicolor-icon-theme'
         'libiodbc'
         'libafterimage'
         'libmariadbclient'
         'postgresql-libs'
         'python2')
optdepends=('gcc-fortran: Enable the Fortran components of ROOT'
            'pythia8: Pythia8 event generator support'
            'tcsh: Legacy CSH support'
            'xrootd: XRootD data access support')
options=('!emptydirs')
source=("https://root.cern.ch/download/root_v${pkgver}.source.tar.gz"
        'root.sh'
        'rootd'
        'root.xml')
sha256sums=('2c3bda69601d94836bdd88283a6585b4774eafc813deb6aa348df0af2922c4d2'
            '9d1f8e7ad923cb5450386edbbce085d258653c0160419cdd6ff154542cc32bd7'
            '3c45b03761d5254142710b7004af0077f18efece7c95511910140d0542c8de8a'
            '50c08191a5b281a39aa05ace4feb8d5405707b4c54a5dcba061f954649c38cb0')
get_py2ver () {
    python2 -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}
prepare() {
    cd "${srcdir}/root"

    find . -type f -exec sed -e 's_#!/usr/bin/env python_&2_' \
                             -e 's/python -O/python2 -O/g' \
                             -e 's/python -c/python2 -c/g' -i {} \;

    sed -e 's/python 2/python2 2/g' \
        -i configure

    sed -e 's/python $(pkgpyexecdir)/python2 $(pkgpyexecdir)/g' \
        -i cint/reflex/python/genreflex/Makefile.am

    sed -e 's/python /python2 /' \
        -i config/genreflex.in config/genreflex-rootcint.in

    # Horid glibc hack
    sed -e 's/__USE_BSD/__USE_MISC/' -i core/base/src/TTimeStamp.cxx
}

build() {
    cd "${srcdir}/root"

    if [ ${CARCH} == 'i686' ]; then
        TARGET=linux;
    else
        TARGET=linuxx8664gcc;
    fi

    declare -a sys_libs
    for sys_lib in afterimage ftgl freetype glew pcre zlib lzma; do
        sys_libs+=("--disable-builtin-${sys_lib}")
    done

    ./configure \
        ${TARGET} \
        --prefix=/usr \
        --enable-gdml \
        --enable-gsl-shared \
        --enable-minuit2 \
        --enable-soversion \
        --enable-roofit \
        --with-python-incdir=/usr/include/python2.7 \
        --with-python-libdir=/usr/lib \
        "${sys_libs[@]}"

    make
}

package() {
    cd "${srcdir}/root"

    make DESTDIR="${pkgdir}" install

    install -D "${srcdir}/rootd" \
        "${pkgdir}/etc/rc.d/rootd"
    install -D -m644 "${srcdir}/root.xml" \
        "${pkgdir}/usr/share/mime/packages/root.xml"

    install -D -m644 "${srcdir}/root/build/package/debian/root-system-bin.desktop.in" \
        "${pkgdir}/usr/share/applications/root-system-bin.desktop"
    # replace @prefix@ with /usr for the desktop
    sed -e 's_@prefix@_/usr_' -i "${pkgdir}/usr/share/applications/root-system-bin.desktop"

    install -D -m644 "${srcdir}/root/build/package/debian/root-system-bin.png" \
        "${pkgdir}/usr/share/icons/hicolor/48x48/apps/root-system-bin.png"

    # Python config
    install -d "${pkgdir}"/usr/lib/python$(get_py2ver)/site-packages
    ln -s "/usr/lib/root" "${pkgdir}"/usr/lib/python$(get_py2ver)/site-packages/
    install -d "${pkgdir}"/usr/lib/python$(get_py2ver)/site-packages/root-${pkgver}-py2.7.egg-info
    echo 'root' "${pkgdir}"/usr/lib/python$(get_py2ver)/site-packages/root-${pkgver}-py2.7.egg-info/top_level.txt

    # use a file that pacman can track instead of adding directly to ld.so.conf
    install -d "${pkgdir}/etc/ld.so.conf.d"
    echo '/usr/lib/root' > "${pkgdir}/etc/ld.so.conf.d/root.conf"

    rm -rf "${pkgdir}/etc/root/daemons"
}
