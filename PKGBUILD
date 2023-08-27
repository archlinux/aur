# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_pkgname=openmpi
pkgname=openmpi-ucx
pkgver=5.0.0rc12
pkgrel=1
pkgdesc='High performance message passing library (MPI)'
arch=(x86_64)
url='https://www.open-mpi.org'
license=('custom:OpenMPI')
depends=(
  gcc-libs
  glibc
  hwloc
  libevent
  libfabric
  libnl
  openpmix
  openssh
  openucx-gpu
  #prrte  # TODO: prrte-3.0.0-1 was built against old openpmix
  zlib
  # TODO: libopen-pal.so links to libamdhip64: https://github.com/open-mpi/ompi/issues/11877
  hip-runtime-amd
  nvidia-utils  # due to libopen-pal.so linking to libcuda - same issue as above
)
makedepends=(
  cuda
  rocm-language-runtime
  hip-runtime-amd
  gcc-fortran
  inetutils
  valgrind
)
optdepends=(
  'cuda: cuda support'
  'gcc-fortran: fortran support'
)
provides=(
  $_pkgname
  libmpi.so
  libmpi_mpifh.so
  libmpi_usempi_ignore_tkr.so
  libmpi_usempif08.so
  libopen-pal.so
  liboshmem.so
  libprrte.so  # TODO: depend on prrte
)
conflicts=($_pkgname)
source=(
  https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/$_pkgname-$pkgver.tar.bz2
)
sha256sums=('b292c5f417b2304c2abc8d9f05520af40375d5c7537552ea77d64fc58771e184')
b2sums=('1fbc70f1ac74556524593572471066c938163337cc235b4f6d9772e7c50327a59186ddebbf39456a5a18232d53a80f4b86ed5874ce57c5eb2e3196e735eb5b33')

build() {
  local configure_options=(
    --prefix=/usr
    --enable-builtin-atomics
    --enable-memchecker
    --enable-mpi-fortran=all
    --enable-pretty-print-stacktrace
    --libdir=/usr/lib
    --sysconfdir=/etc/$_pkgname
    --with-ucx=/usr
    --with-cuda=/opt/cuda
    # this tricks the configure script to look for /usr/lib/pkgconfig/cuda.pc
    # instead of /opt/cuda/lib/pkgconfig/cuda.pc
    --with-cuda-libdir=/usr/lib
    --with-rocm=/opt/rocm
    --with-ofi=/usr
    --with-hwloc=external
    --with-libevent=external
    --with-pmix=external
    # TODO: prrte-3.0.0-1 was built against old openpmix
    #--with-prrte=external
    --with-valgrind
  )
  cd $_pkgname-$pkgver

  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make V=1
}

check() {
  make check -C $_pkgname-$pkgver
}

package() {
  depends+=(libpmix.so)

  make DESTDIR="$pkgdir" install -C $_pkgname-$pkgver
  install -Dm 644 $_pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
