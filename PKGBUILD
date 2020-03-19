# Maintainer: Tyler Thorn <firebirdracer79[at]gmail>
# Adapted from openmpi package by:
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=openmpi-slurm
pkgver=4.0.3
pkgrel=1
pkgdesc='High performance message passing library (MPI)'
url='https://www.open-mpi.org'
arch=('x86_64' 'aarch64')
license=('custom:OpenMPI')
depends=('libltdl' 'hwloc' 'openssh' 'zlib' 'libnl')
makedepends=('inetutils' 'valgrind' 'gcc-fortran')
optdepends=('gcc-fortran: fortran support')
options=('staticlibs')
source=(https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('1402feced8c3847b3ab8252165b90f7d1fa28c23b6b2ca4632b6e4971267fd03')
sha512sums=('01f773064c575a0fe6ab081c20c5cf07ba1c9eada5ecfe520d14ce2b9fc6d021d0f56a0159fa354fd6c8e2bb7354a272aa8d0063b351f59251deb56474849acc')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc/${pkgname} \
    --enable-mpi-fortran=all \
    --libdir=/usr/lib/${pkgname} \
    --enable-builtin-atomics \
    --enable-mpi-cxx \
    --with-valgrind \
    --enable-memchecker \
    --enable-pretty-print-stacktrace \
    --with-slurm \
    --with-hwloc=/usr \
    --with-libltdl=/usr  \
    FC=/usr/bin/gfortran \
    LDFLAGS="${LDFLAGS} -Wl,-z,noexecstack"
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # FS#28583
  install -dm 755 "${pkgdir}/usr/lib/pkgconfig"
  for i in ompi-c.pc ompi-cxx.pc ompi-f77.pc ompi-f90.pc ompi.pc; do
    ln -sf "/usr/lib/openmpi/pkgconfig/${i}" "${pkgdir}/usr/lib/pkgconfig/"
  done

  install -dm 755 "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${pkgname}.conf
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
