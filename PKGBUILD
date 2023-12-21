# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Myles English <myles at rockhead dot biz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=scalapack
pkgver=2.2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="subset of scalable LAPACK routines redesigned for distributed memory MIMD parallel computers."
url="http://www.netlib.org/scalapack/"
license=('custom')
depends=('glibc' 'openmpi' 'blas' 'lapack') # 'atlas-lapack' 'blacs-openmpi' )
makedepends=('cmake' 'gcc-fortran')
provides=('blacs')
install=${pkgname}.install
source=(http://www.netlib.org/scalapack/$pkgname-$pkgver.tgz http://www.netlib.org/scalapack/manpages.tgz Makefile example1.f)
sha256sums=('40b9406c20735a9a3009d863318cb8d3e496fb073d201c5463df810e01ab2a57'
            'a745c9f367d65e3c7611c126597a4681094b002552e47b621964d30a966aac7b'
            '5f7e81c1c76fc010677fd446bfc689c7f6af1a22a51093e8790e8a615159c541'
            'd9904ecb69f318c4782c0bd39ff2bff511af31960a2383a9d42d6620a266ea70')


build() {
  cmake -S ${pkgname}-${pkgver} \
        -B build \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D BUILD_SHARED_LIBS:BOOL=ON \
        -D SCALAPACK_BUILD_TESTS:BOOL=OFF \
        -D CMAKE_BUILD_TYPE:STRING=Release \
        -D CMAKE_Fortran_FLAGS:STRING="$FCFLAGS -fallow-argument-mismatch"
  cmake --build build --parallel
}

package(){
  DESTDIR=${pkgdir} cmake --install build

  # Install headers
  install -m 755 -d "${pkgdir}"/usr/include
  install -m 644 -D "${srcdir}"/${pkgname}-${pkgver}/PBLAS/SRC/*.h "${pkgdir}"/usr/include
  install -m 644 -D "${srcdir}"/${pkgname}-${pkgver}/BLACS/SRC/*.h "${pkgdir}"/usr/include

  # Install man pages
  install -m 755 -d "${pkgdir}"/usr/share/man/manl
  install -m 644 "${srcdir}"/MANPAGES/man/manl/*.l ${PREFIX} "${pkgdir}"/usr/share/man/manl

  # Install examples
  install -m 755 -d "${pkgdir}"/usr/share/$pkgname/examples
  install -m 644 "${srcdir}"/Makefile "${pkgdir}"/usr/share/${pkgname}/examples
  install -m 644 "${srcdir}"/example1.f "${pkgdir}"/usr/share/${pkgname}/examples

  # Install license
  install -m 644 -D "${srcdir}"/${pkgname}-${pkgver}/LICENSE \
	  "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
