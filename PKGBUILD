# Maintainer: tuxzz <dorazzsoft@gmail.com>

pkgname=fftw-amd
pkgver=3.3.8.amd2.2
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT) - AMD Zen/Zen2 Optimized Version"
arch=('x86_64')
license=('GPL2')
url="https://github.com/amd/amd-fftw/"
depends=('bash' 'gcc-libs' 'glibc' 'openmpi')
makedepends=('gcc-fortran')
provides=('libfftw3q_threads.so' 'libfftw3q_omp.so' 'libfftw3q.so'
'libfftw3l_threads.so' 'libfftw3l_omp.so' 'libfftw3l_mpi.so' 'libfftw3l.so'
'libfftw3f_threads.so' 'libfftw3f_omp.so' 'libfftw3f_mpi.so' 'libfftw3f.so'
'libfftw3_threads.so' 'libfftw3_omp.so' 'libfftw3_mpi.so' 'libfftw3.so' 'fftw=3.3.8-3')
conflicts=('fftw')
source=(
  "https://github.com/amd/amd-fftw/archive/2.2.tar.gz"
)
sha512sums=(
  'ccf7e04d282df1c0dcb7dae6997e08503dae068f32fea105dc427060066c73d195c2eec7c24d0d388d36926bc7d0ca68a5ab0432a3858fad40e6e3136fbdaab8'
)

prepare() {
  rm -r "${pkgname}-${pkgver}" || true
  mv -v amd-fftw-2.2 "${pkgname}-${pkgver}"
  cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-double"
  cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-double"
  cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-long-double"
  cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-quad"
}

build() {
  export F77='gfortran'
  export CFLAGS=" -march=native -pipe -fno-plt -ftree-vectorize -Ofast -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math -flto"
  export FFLAGS=" -march=native -pipe -fno-plt -ftree-vectorize -Ofast -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math -flto"
  _default_configure="./configure --prefix=/usr --enable-shared --enable-threads --enable-mpi --enable-openmp"

  # configure single precision
  (
    cd "${pkgname}-${pkgver}"
    ${_default_configure} --enable-sse2 --enable-avx --enable-avx2 --enable-single --enable-amd-opt
  )

  # configure double precision
  (
    cd "${pkgname}-${pkgver}-double"
    ${_default_configure} --enable-sse2 --enable-avx --enable-avx2 --enable-amd-opt
  )

  # configure long-double precission
  (
    cd "${pkgname}-${pkgver}-long-double"
    ${_default_configure} --enable-long-double
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
  make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}-double"
  make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}-long-double"
  make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}-quad"
  cd "${pkgname}-${pkgver}"
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,TODO,README_AMD.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
