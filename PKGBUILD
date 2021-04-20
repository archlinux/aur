# Maintainer: Entshuld <edgar at 0penm4il dot cc>
# Contributor: Denis Gagnon <gagnon88 at gm41l dot com>, Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

realname=fftw
pkgname=${realname}-mpi
pkgver=3.3.9
pkgrel=1
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
sha512sums=('52ebc2a33063a41fd478f6ea2acbf3b511867f736591d273dd57f9dfca5d3e0b0c73157921b3a36f1a7cfd741a8a6bde0fd80de578040ae730ea168b5ba466cf')
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
  printf "INFO: copying ${realname}-${pkgver} into -dobule -long and -single directories ..."
  cp -a "${realname}-${pkgver}" "${realname}-${pkgver}-double"
  cp -a "${realname}-${pkgver}" "${realname}-${pkgver}-long-double"
  # Quad and MPI don't play along
  # cp -a "${realname}-${pkgver}" "${realname}-${pkgver}-quad"
  mv fftw-${pkgver} fftw-${pkgver}-single
  printf " done\n"
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
