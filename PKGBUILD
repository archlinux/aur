# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=openmpi3-gcc8
_pkgname=openmpi
pkgver=3.1.4
_gccver=8.3.0
pkgrel=1
pkgdesc='High performance message passing library (MPI), version 3 (built with GCC8)'
url='https://www.open-mpi.org'
arch=('x86_64')
license=('custom:OpenMPI')
depends=('libltdl' 'hwloc' 'openssh' 'zlib' 'libnl' 'gcc8' 'gcc8-libs')
makedepends=('inetutils' 'valgrind' 'gcc8-fortran')
optdepends=('gcc8-fortran: fortran support')
conflicts=('openmpi')
provides=("openmpi=${pkgver}")
options=('staticlibs')
source=(https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('17a69e0054db530c7dc119f75bd07d079efa147cf94bf27e590905864fe379d6')
sha512sums=('5b4aafffc79fd85cb94a11a6e2fac563b142ac532191009eb35826c432ed3c391a6616e2ca92eacbf36137468eadb7c0f7ddc787034bc95c4214232ed5128338')

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
    CC=/usr/bin/gcc-8 CXX=/usr/bin/g++-8 FC=/usr/bin/gfortran-8 \
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
