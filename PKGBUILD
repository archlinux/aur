# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=openmpi-gcc6
pkgver=4.0.1
pkgrel=1
pkgdesc='High performance message passing library (MPI) built with gcc6'
url='https://www.open-mpi.org'
arch=('x86_64')
license=('custom:OpenMPI')
depends=('libltdl' 'hwloc' 'openssh' 'zlib' 'libnl' 'gcc6')
makedepends=('inetutils' 'valgrind' 'gcc6-fortran')
optdepends=('gcc6-fortran: fortran support')
options=('staticlibs')
source=(https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/${pkgname%-gcc6}-${pkgver}.tar.bz2)
sha256sums=('cce7b6d20522849301727f81282201d609553103ac0b09162cf28d102efb9709')
sha512sums=('09f35dc2e44b4f84aab9c5af9d81f90bbdb030e4d90800a5d3ffae88cb32b7faecc9bea0abb113da53c21f73e9d19db68f961f997bc47bdd28d83a87beee0731')

build() {
  cd ${pkgname%-gcc6}-${pkgver}
  export LD_LIBRARY_PATH="/usr/lib/gcc/x86_64-pc-linux-gnu/6.5.0:$LD_LIBRARY_PATH"
  ./configure --prefix=/opt/${pkgname} \
    --sysconfdir=/etc/${pkgname} \
    --enable-mpi-fortran=all \
    --libdir=/opt/${pkgname}/lib \
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
    ln -sf "/opt/${pkgname}/lib/pkgconfig/${i}" "${pkgdir}/usr/lib/pkgconfig/${i%.pc}-gcc6.pc"
  done

  install -dm 755 "${pkgdir}/etc/ld.so.conf.d"
  echo "/opt/${pkgname}/lib" > "${pkgdir}"/etc/ld.so.conf.d/${pkgname}.conf
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
