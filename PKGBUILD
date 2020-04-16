# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=openmpi3
_pkgname=openmpi
pkgver=3.1.6
pkgrel=1
pkgdesc='High performance message passing library (MPI), version 3'
url='https://www.open-mpi.org'
arch=('x86_64')
license=('custom:OpenMPI')
depends=('libltdl' 'hwloc<2' 'openssh' 'zlib' 'libnl')
makedepends=('inetutils' 'valgrind' 'gcc-fortran')
optdepends=('gcc-fortran: fortran support')
conflicts=('openmpi')
provides=("openmpi=${pkgver}")
options=('staticlibs')
source=(https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('50131d982ec2a516564d74d5616383178361c2f08fdd7d1202b80bdf66a0d279')
sha512sums=('23d39e6f6f68107aa03d9f37e673c739cedb3b63731b693be3d0def236863ce6e8405f93de1734e0725c33674b6873bbf5179108fa13138dea49cee792c868bc')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc/${_pkgname} \
    --enable-mpi-fortran=all \
    --libdir=/usr/lib/${_pkgname} \
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
    FC=/usr/bin/gfortran \
    LDFLAGS="${LDFLAGS} -Wl,-z,noexecstack"
  make
}

check() {
  cd ${_pkgname}-${pkgver}
  make check
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # FS#28583
  install -dm 755 "${pkgdir}/usr/lib/pkgconfig"
  for i in ompi-c.pc ompi-cxx.pc ompi-f77.pc ompi-f90.pc ompi.pc; do
    ln -sf "/usr/lib/openmpi/pkgconfig/${i}" "${pkgdir}/usr/lib/pkgconfig/"
  done

  install -dm 755 "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${_pkgname}.conf
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
