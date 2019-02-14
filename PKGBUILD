# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=openmpi-gcc6
pkgver=4.0.0
pkgrel=1
pkgdesc='High performance message passing library (MPI) build with gcc6'
url='https://www.open-mpi.org'
arch=('x86_64')
license=('custom:OpenMPI')
depends=('libltdl' 'hwloc' 'openssh' 'zlib' 'libnl' 'gcc6')
makedepends=('inetutils' 'valgrind' 'gcc6-fortran')
optdepends=('gcc6-fortran: fortran support')
options=('staticlibs')
source=(https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/${pkgname%-gcc6}-${pkgver}.tar.bz2)
sha256sums=('2f0b8a36cfeb7354b45dda3c5425ef8393c9b04115570b615213faaa3f97366b')
sha512sums=('978097dcbb16df2a616dcbbef9536fed0f7be40914daa8f927882d91bdda9265e54334fc12aeef49b41073d8782321b5611a7e9c71182258a45bca5f640e927b')

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
