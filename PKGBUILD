# Maintainer: Adam <adam900710@gmail.com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=fftw
pkgname=lib32-${_pkgname}
pkgver=3.3.10
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT) (32 bit)"
arch=('x86_64')
license=('GPL2')
url="https://www.fftw.org/"
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-fortran')
provides=('libfftw3q_threads.so' 'libfftw3q_omp.so' 'libfftw3q.so'
          'libfftw3l_threads.so' 'libfftw3l_omp.so' 'libfftw3l.so'
          'libfftw3f_threads.so' 'libfftw3f_omp.so' 'libfftw3f.so'
          'libfftw3_threads.so' 'libfftw3_omp.so' 'libfftw3.so')
source=("https://www.fftw.org/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467')


prepare() {
    cp -av ${_pkgname}-${pkgver} ${_pkgname}-${pkgver}-double
    cp -av ${_pkgname}-${pkgver} ${_pkgname}-${pkgver}-long-double
    cp -av ${_pkgname}-${pkgver} ${_pkgname}-${pkgver}-quad
}

build() {
    cd ${srcdir}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    # Use upstream default CFLAGS while keeping our -march/-mtune
    CFLAGS+=" -O3 -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"

    CONFIGURE="./configure F77=gfortran \
            --prefix=/usr \
            --enable-shared
            --enable-threads \
            --enable-openmp \
            --libdir=/usr/lib32"

    # Configure single precision
    (
        cd "${_pkgname}-${pkgver}"
        $CONFIGURE --enable-sse --enable-avx --enable-single
        # NOTE: Fix overlinking
        sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    )

    # Configure double precision
    (
        cd "${_pkgname}-${pkgver}-double"
        $CONFIGURE --enable-sse2 --enable-avx
        # NOTE: Fix overlinking
        sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    )

    # Configure long-double precision
    (
        cd "${_pkgname}-${pkgver}-long-double"
        $CONFIGURE --enable-long-double
        # NOTE: Fix overlinking
        sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    )

    # Configure quad precision
    (
        cd "${_pkgname}-${pkgver}-quad"
        $CONFIGURE --disable-mpi --enable-quad-precision
        # NOTE: Fix overlinking
        sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    )

    make -C "${_pkgname}-${pkgver}"
    make -C "${_pkgname}-${pkgver}-double"
    make -C "${_pkgname}-${pkgver}-long-double"
    make -C "${_pkgname}-${pkgver}-quad"
}

package() {
    cd ${srcdir}

    make DESTDIR="${pkgdir}" install -C "${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install -C "${_pkgname}-${pkgver}-double"
    make DESTDIR="${pkgdir}" install -C "${_pkgname}-${pkgver}-long-double"
    make DESTDIR="${pkgdir}" install -C "${_pkgname}-${pkgver}-quad"

    rm -rf "${pkgdir}/usr"/{bin,include,share}
}
