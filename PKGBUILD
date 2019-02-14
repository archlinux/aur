# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=openmpi-gcc6
pkgver=3.1.3
pkgrel=2
pkgdesc='High performance message passing library (MPI) build with gcc6'
url='https://www.open-mpi.org'
arch=('x86_64')
license=('custom:OpenMPI')
depends=('libltdl' 'hwloc' 'openssh' 'zlib' 'libnl' 'gcc6')
makedepends=('inetutils' 'valgrind' 'gcc6-fortran')
optdepends=('gcc6-fortran: fortran support')
options=('staticlibs')
source=(https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/${pkgname%-gcc6}-${pkgver}.tar.bz2)
sha256sums=('8be04307c00f51401d3fb9d837321781ea7c79f2a5a4a2e5d4eaedc874087ab6')
sha512sums=('700821df676de5f85ce2793298242dcaea73f585f89540e30999792a568f193545a9f9b2bcb3ea22effa3bf14744531c4eb5fc4c84a8d7bbe5e5fdd76ab3a04a')

build() {
  cd ${pkgname%-gcc6}-${pkgver}
  export LD_LIBRARY_PATH="/usr/lib/gcc/x86_64-pc-linux-gnu/6.5.0:$LD_LIBRARY_PATH"
  ./configure --prefix=/opt/${pkgname} \
    --sysconfdir=/etc/${pkgname} \
    --enable-mpi-fortran=all \
    --libdir=/usr/lib/${pkgname} \
    --with-threads=posix \
    --enable-mpi-thread-multiple \
    --enable-smp-locks \
    --enable-builtin-atomics \
    --enable-mpi-cxx \
    --with-valgrind \
    --enable-memchecker \
    --enable-pretty-print-stacktrace \
    --without-slurm \
    --with-hwloc=/usr \
    --with-libltdl=/usr  \
    CC=/usr/bin/gcc-6 CXX=/usr/bin/g++-6 FC=/usr/bin/gfortran-6 \
    LDFLAGS="${LDFLAGS} -Wl,-z,noexecstack"
  make
}

check() {
  cd ${pkgname%-gcc6}-${pkgver}
  make check
}

package() {
  cd ${pkgname%-gcc6}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # FS#28583
  install -dm 755 "${pkgdir}/usr/lib/pkgconfig"
  for i in ompi-c.pc ompi-cxx.pc ompi-f77.pc ompi-f90.pc ompi.pc; do
    ln -sf "/usr/lib/${pkgname}/pkgconfig/${i}" "${pkgdir}/usr/lib/pkgconfig/${i%.pc}-gcc6.pc"
  done

  install -dm 755 "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${pkgname}.conf
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
