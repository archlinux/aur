# Maintainer: Carlchristian Eckert <carli-eckert at gmx dot de>

pkgname=libadios-git
pkgver=1.10.0.r422.g084b08f
pkgrel=1
pkgdesc="ADIOS Adaptable IO system for simulations. The Adaptable IO System (ADIOS) provides a simple, flexible way for scientists to describe the data in their code that may need to be written, read, or processed outside of the running simulation."
url="https://www.olcf.ornl.gov/center-projects/adios/"
install=$pkgname.install
license=('BSD')
arch=('i686' 'x86_64')
depends=('openmpi' 'python2' 'mxml' 'gcc-fortran')
source=("${pkgname}::git://github.com/ornladios/ADIOS.git")
makedepends=('git')
sha256sums=('SKIP')

pkgver(){
    cd ${pkgname}
    # remove leading "v", then remove everything after the first "-"
    # RELEASE=$(git describe --long --tags | sed 's/v//;s/-.\+//')

    # take version directly from their version file, since that is what is reported internally
    RELEASE=$(grep -o "ADIOS_VERSION \"[.0-9]\+\"" src/public/adios_version.h | sed 's/[^.0-9]//g')

    # remove everything before the first "-", including the "-"; then replace remaining "-" with "."
    REVISION=$(git describe --long --tags | sed 's/[^-]\+-//;s/-/./g')
    echo ${RELEASE}.r${REVISION}
}


prepare() {
    cd ${pkgname}
    # replace all occurences of python with python2 to avoid using the default python3
    find . -type f -print0 | xargs -0 sed -i -e 's/\(#\!\/usr\/bin\/env python\)/\12/' -e 's/python \(.*.py\)/python2 \1/'
}

build() {
    cd ${pkgname}
    ./autogen.sh
    CFLAGS="$CFLAGS -fPIC" ./configure --enable-static --enable-shared --prefix=/usr/ \
        --with-mxml=/usr \
        --with-mpi=/usr \
        --with-zlib=/usr
    make
}

check() {
    cd ${pkgname}
    make check
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
