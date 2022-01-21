_pkgname=openmpi
pkgname=${_pkgname}-gcc10
pkgver=4.1.2
_gccver=10.3.0
pkgrel=1
pkgdesc='High performance message passing library (MPI) (built with GCC10)'
url='https://www.open-mpi.org'
arch=('x86_64')
license=('custom:OpenMPI')
depends=('libltdl' 'hwloc' 'openssh' 'zlib' 'libnl' 'gcc10' 'gcc10-libs')
makedepends=('inetutils' 'valgrind' 'gcc10-fortran')
optdepends=('gcc10-fortran: fortran support')
conflicts=('openmpi')
provides=("openmpi=${pkgver}")
options=('staticlibs')
source=(https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('9b78c7cf7fc32131c5cf43dd2ab9740149d9d87cadb2e2189f02685749a6b527')

build() {
  cd ${_pkgname}-${pkgver}

  export LD_LIBRARY_PATH="/usr/lib/gcc/x86_64-pc-linux-gnu/${_gccver}:$LD_LIBRARY_PATH"
  export LD_PRELOAD=/usr/lib/libstdc++.so

  ./configure --prefix=/usr \
    --sysconfdir=/etc/${_pkgname} \
    --enable-mpi-fortran=all \
    --libdir=/usr/lib/${_pkgname} \
    --enable-builtin-atomics \
    --enable-mpi-cxx \
    --with-valgrind \
    --enable-memchecker \
    --enable-pretty-print-stacktrace \
    --without-slurm \
    --with-hwloc=/usr \
    --with-libltdl=/usr  \
    CC=/usr/bin/gcc-10 CXX=/usr/bin/g++-10 FC=/usr/bin/gfortran-10 \
    LDFLAGS="${LDFLAGS} -Wl,-z,noexecstack"
  make
}

#check() {
#  cd ${_pkgname}-${pkgver}
#  make check
#}

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
