# Maintainer: Kiet To <kwrazi at gmail dot com>

pkgname=fftss
pkgver=3.0
_pkgver="${pkgver}-20071031"
pkgrel=1
pkgdesc="an open source library for computing the Fast Fourier Transform"
arch=('i686' 'x86_64')
url="https://www.ssisc.org/fftss/index.en.html"
license=('LGPL')
source=("https://www.ssisc.org/fftss/dl/${pkgname}-${_pkgver}.tar.gz"
        "cmake.tar.gz")
sha256sums=('5c82f8f918de6b996c2e760c7ba654d429667b9d8649aef3a57d0c72227ee9e8'
            '706a756c0545643ad40ce441b2c0f4bb11d04b80774bc12f297babb3ec6f1845')

build() {
  cd "$srcdir/${pkgname}-${_pkgver}"

  for FILE in libfftss/Makefile.am \
              libfftss/Makefile.in \
              libpfftss/Makefile.am \
              libpfftss/Makefile.in ; do
    sed -i 's/version-info 1:0:0/version-info 3:0:0/' $FILE
  done

  # Optional configure flags
  #    --without-simd        Do not use SIMD instructions.
  #    --without-asm         Do not use assembly codes.
  #    --with-bg             Build for IBM Blue Gene system. (cross build)
  #    --with-bg-compat      Enable FFT kernels for Blue Gene in compatible mode.
  #    --with-recommended    Set recommended CC and CFLAGS variables.
  #    --enable-openmp       Enable OpenMP.
  #    --enable-mpi          Enable MPI.
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$srcdir/${pkgname}-${_pkgver}"

  make DESTDIR="$pkgdir/" install

  install -dv $pkgdir/usr/lib/cmake/fftss
  install -Dv $srcdir/cmake/fftss/* $pkgdir/usr/lib/cmake/fftss
}

# vim:set ts=2 sw=2 et:
