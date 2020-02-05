# Maintainer: Entshuld <edgar at 0penm4il dot cc>
# Contributor: Denis Gagnon <gagnon88 at gm41l dot com>, Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

realname=fftw
pkgname=${realname}-mpi
pkgver=3.3.8
pkgrel=2
pkgdesc="A library for computing the discrete Fourier transform (DFT), compiled with MPI and OpenMP support: header files, static and shared libraries"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.fftw.org/"
depends=('glibc' 'bash' 'openmpi' 'gcc-libs')
conflicts=('fftw')
makedepends=('gcc-fortran')
provides=("$realname" # 'libfftw3q_threads.so' 'libfftw3q_omp.so' 'libfftw3q.so'
'libfftw3l_threads.so' 'libfftw3l_omp.so' 'libfftw3l_mpi.so' 'libfftw3l.so'
'libfftw3f_threads.so' 'libfftw3f_omp.so' 'libfftw3f_mpi.so' 'libfftw3f.so'
'libfftw3_threads.so' 'libfftw3_omp.so' 'libfftw3_mpi.so' 'libfftw3.so')
source=("http://www.fftw.org/fftw-${pkgver}.tar.gz")
sha512sums=('ab918b742a7c7dcb56390a0a0014f517a6dff9a2e4b4591060deeb2c652bf3c6868aa74559a422a276b853289b4b701bdcbd3d4d8c08943acf29167a7be81a38')
options=('staticlibs')
install=fftw.install

# notes:
# http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69
# http://www.fftw.org/faq/section2.html#singleprec
# http://www.fftw.org/fftw3_doc/Precision.html#Precision

# use upstream default CFLAGS while keeping our -march/-mtune
CFLAGS+=" -O3 -fPIC -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math"

prepare() {
# issue with ocaml-num
#  mv -v "fftw3-${realname}-${pkgver}" "${realname}-${pkgver}"
#  (
#    cd "$realname-$pkgver"
#    cp -v NEWS ChangeLog
#    autoreconf -vfi
#  )
  cp -av "${realname}-${pkgver}" "${realname}-${pkgver}-double"
  cp -av "${realname}-${pkgver}" "${realname}-${pkgver}-long-double"
  cp -av "${realname}-${pkgver}" "${realname}-${pkgver}-quad"
  mv fftw-${pkgver} fftw-${pkgver}-single
}


build() {
  CONFIGURE="./configure F77=gfortran --prefix=/usr --enable-shared --enable-threads --enable-mpi --enable-openmp"

  # build double precision
  (
    cd "${realname}-${pkgver}-double"
    $CONFIGURE --enable-sse2 --enable-avx
  )

  # build & install long double precission
  (
    cd "${realname}-${pkgver}-long-double"
    $CONFIGURE --enable-long-double
  )

  # Quad and MPI don't play along
  # # build & install quad precission
  # (
  #   cd "${realname}-${pkgver}-quad"
  #   $CONFIGURE --enable-quad-precision
  # )

  # build & install single precision
  (
    cd "${realname}-${pkgver}-single"
    $CONFIGURE --enable-float --enable-sse --enable-avx --enable-single
  )

  make -C "${realname}-${pkgver}-single"
  make -C "${realname}-${pkgver}-double"
  make -C "${realname}-${pkgver}-long-double"
  # make -C "${realname}-${pkgver}-quad"
}

package() {
  make DESTDIR=${pkgdir} install -C "${realname}-${pkgver}-single"
  make DESTDIR=${pkgdir} install -C "${realname}-${pkgver}-long-double"
  make DESTDIR=${pkgdir} install -C "${realname}-${pkgver}-double"
  # Quad and MPI don't play along
  # make DESTDIR=${pkgdir} install -C "${realname}-${pkgver}-quad"
  install -vDm 644 "${srcdir}/fftw-${pkgver}-single"/{AUTHORS,ChangeLog,NEWS,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
