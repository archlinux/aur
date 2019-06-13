# Maintainer: Han Luo <han dot luo at gmail dot com>
pkgname=ga-impi
provides=("ga-impi" "ga" "libarmci" "libga")
conflicts=("ga-openmpi" "ga-mpich")
_pkgname=ga
pkgver=5.7
pkgrel=1
pkgdesc='Global Arrays Toolkit for Intel MPI'
arch=('i686' 'x86_64')
url='https://github.com/GlobalArrays/ga'
license=('custom')
depends=('intel-mkl' 'intel-mpi' 'libfabric')
makedepends=('intel-compiler-base' 'intel-fortran-compiler')
source=("https://github.com/GlobalArrays/ga/releases/download/v${pkgver}/ga-${pkgver}.tar.gz"
        "ga.pc"
        "ga.sh")
sha256sums=('3ed1ab47adfda7bceb7beca12fc05a2e1631732f0e55bbaf9036dad4e3da4774'
            'c266d6ec471753ce525454e08d872e0553124f70d53c4aa381990c40e1edc74a'
            '5aa7a3b5e188e271cbc5eb7f5e5c2b603953bef4e22f1e786c498a607c400edd')

build () {
  cd ${srcdir}/${_pkgname}-${pkgver}
  MPICXX=mpiicpc  MPICC=mpiicc MPIF77=mpiifort ./configure --enable-i8 \
           --with-blas8=-mkl --prefix=/usr --enable-cxx --includedir=/usr/include/ga
  make
}

package () {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
  install -Dm644 ${srcdir}/ga.pc     "${pkgdir}/usr/lib/pkgconfig/ga.pc"
  install -Dm755 ${srcdir}/ga.sh     "${pkgdir}/etc/profile.d/ga.sh"
}

