# Maintainer: Carlchristian Eckert <carli-eckert at gmx dot de>

pkgname=libadios
pkgver=1.13.1
pkgrel=1
pkgdesc="ADIOS Adaptable IO system for simulations. The Adaptable IO System (ADIOS) provides a simple, flexible way for scientists to describe the data in their code that may need to be written, read, or processed outside of the running simulation."
url="https://www.olcf.ornl.gov/center-projects/adios/"
install=$pkgname.install
license=('BSD')
arch=('i686' 'x86_64')
depends=('openmpi' 'python2' 'mxml' 'gcc-fortran')
source=(
    http://users.nccs.gov/~pnorbert/adios-$pkgver.tar.gz
    )
sha256sums=(
    '684096cd7e5a7f6b8859601d4daeb1dfaa416dfc2d9d529158a62df6c5bcd7a0'
    )

prepare() {
    cd $srcdir/adios-$pkgver

    # replace all occurences of python with python2 to avoid using the default python3
    find . -type f -print0 | xargs -0 sed -i -e 's/\(#\!\/usr\/bin\/env python\)/\12/' -e 's/python \(.*.py\)/python2 \1/'
}

build() {
    cd $srcdir/adios-$pkgver
    autoreconf -f -i
    CFLAGS="$CFLAGS -fPIC" ./configure --enable-static --enable-shared --prefix=/usr/ \
        --with-mxml=/usr \
        --with-mpi=/usr \
        --with-zlib=/usr

    make
}

check() {
    cd $srcdir/adios-$pkgver
    make check
}

package() {
    cd $srcdir/adios-$pkgver
    make DESTDIR="${pkgdir}" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
