# Submitter: tuxzz <dorazzsoft@gmail.com>
# Maintainer: EntropicEffect <william.grunow93@gmail.com>
pkgname=fftw-amd
pkgver=3.3.10amd4.2
pkgrel=0
pkgdesc="A library for computing the discrete Fourier transform (DFT) - AMD Ryzen/EPYC Optimized Version"
arch=('x86_64')
license=('GPL2')
url="https://github.com/amd/amd-fftw/"
conflicts=('fftw')
makedepends=(
  bash
  cmake
  gcc-fortran
  gcc-libs
  glibc
  openmpi
)

source=(
  "https://github.com/amd/amd-fftw/archive/refs/tags/4.2.tar.gz"
)
sha512sums=(
  "e6d77c31369f7e6e87ff7d32b274903168a0ac0228976c73f29ac9dbdd124f2ed1b54d5eac3c8e278f11bb51a7c30bda8c8395951f7784a87eb33ebf12c0e115"
)

prepare() {
  rm -r "${pkgname}-${pkgver}" || true
  mv -v amd-fftw-4.2 "${pkgname}-${pkgver}"
  cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-double"
  cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-double"
  cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-long-double"
  cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-quad"
}

build() {
  export F77='gfortran'
  export CFLAGS=" -march=native -pipe -fno-plt -ftree-vectorize -Ofast -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math -flto"
  export FFLAGS=" -march=native -pipe -fno-plt -ftree-vectorize -Ofast -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math -flto"
  _default_configure="./configure --prefix=/usr --enable-shared --enable-threads --enable-mpi --enable-openmp --enable-dynamic-dispatcher"

  # configure single precision
  (
    cd "${pkgname}-${pkgver}"
    ${_default_configure} --enable-sse2 --enable-avx --enable-avx2 --enable-single --enable-amd-opt --enable-amd-mpifft
  )

  # configure double precision
  (
    cd "${pkgname}-${pkgver}-double"
    ${_default_configure} --enable-sse2 --enable-avx --enable-avx2 --enable-amd-opt --enable-amd-mpifft
  )

  # configure long-double precission
  (
    cd "${pkgname}-${pkgver}-long-double"
    ${_default_configure} --enable-long-double --enable-amd-mpifft
  )

  # configure quad precision
  (
    cd "${pkgname}-${pkgver}-quad"
    ${_default_configure} --disable-mpi --enable-quad-precision
  )

  make -C "${pkgname}-${pkgver}"
  make -C "${pkgname}-${pkgver}-double"
  make -C "${pkgname}-${pkgver}-long-double"
  make -C "${pkgname}-${pkgver}-quad"
}

package() {
    depends=(
    bash
    gcc-libs
    glibc
    openmpi
  )
  provides=(
    fftw
    libfftw3q_threads.so
    libfftw3q_omp.so
    libfftw3q.so
    libfftw3l_threads.so
    libfftw3l_omp.so
    libfftw3l.so
    libfftw3f_threads.so
    libfftw3f_omp.so
    libfftw3f.so
    libfftw3_threads.so
    libfftw3_omp.so
    libfftw3.so
    libfftw3l_mpi.so
    libfftw3f_mpi.so
    libfftw3_mpi.so
  )

  make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}-double"
  make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}-long-double"
  make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}-quad"
  cd "${pkgname}-${pkgver}"
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,TODO,README_AMD.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
