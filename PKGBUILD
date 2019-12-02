# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=openmpi3-gcc7
_pkgname=openmpi
pkgver=3.1.5
_gccver=7.5.0
pkgrel=1
pkgdesc='High performance message passing library (MPI), version 3 (built with GCC7)'
url='https://www.open-mpi.org'
arch=('x86_64')
license=('custom:OpenMPI')
depends=('libltdl' 'hwloc<2' 'openssh' 'zlib' 'libnl' 'gcc7' 'gcc7-libs')
makedepends=('inetutils' 'valgrind' 'gcc7-fortran')
optdepends=('gcc7-fortran: fortran support')
conflicts=('openmpi')
provides=("openmpi=${pkgver}")
options=('staticlibs')
source=(https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('fbf0075b4579685eec8d56d34d4d9c963e6667825548554f5bf308610af72133')
sha512sums=('040591c8715717568b1af60f4710e4bf31fab84ac1919dc29bf6f42c2a5aa65ad0b13850033a8ef94363f391511061de729c837867822ea02366e51b90bcddd4')

build() {
  cd ${_pkgname}-${pkgver}

  export LD_LIBRARY_PATH="/usr/lib/gcc/x86_64-pc-linux-gnu/${_gccver}:$LD_LIBRARY_PATH"
  export LD_PRELOAD=/usr/lib/libstdc++.so

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
    CC=/usr/bin/gcc-7 CXX=/usr/bin/g++-7 FC=/usr/bin/gfortran-7 \
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
    ln -sf "/usr/lib/${_pkgname}/pkgconfig/${i}" "${pkgdir}/usr/lib/pkgconfig/"
  done

  install -dm 755 "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${_pkgname}.conf
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
