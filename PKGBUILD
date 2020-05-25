_pkgname=openmpi
pkgname=${_pkgname}-gcc8
pkgver=4.0.3
_gccver=8.4.0
pkgrel=1
pkgdesc='High performance message passing library (MPI) (built with GCC8)'
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
sha256sums=('1402feced8c3847b3ab8252165b90f7d1fa28c23b6b2ca4632b6e4971267fd03')
sha512sums=('01f773064c575a0fe6ab081c20c5cf07ba1c9eada5ecfe520d14ce2b9fc6d021d0f56a0159fa354fd6c8e2bb7354a272aa8d0063b351f59251deb56474849acc')

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
    ln -sf "/usr/lib/openmpi/pkgconfig/${i}" "${pkgdir}/usr/lib/pkgconfig/"
  done

  install -dm 755 "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${_pkgname}.conf
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
