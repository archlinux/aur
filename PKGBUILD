# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_pkgname=openmpi
pkgname=openmpi-ucx
pkgver=5.0.1
pkgrel=2
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
  prrte
  zlib
)
makedepends=(
  cuda
  hip-runtime-amd
  gcc-fortran
  inetutils
  valgrind
)
optdepends=(
  'cuda: CUDA support'
  'hip-runtime-amd: ROCm support'
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
)
conflicts=($_pkgname)
source=(
  https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/$_pkgname-$pkgver.tar.bz2
)
sha256sums=('e357043e65fd1b956a47d0dae6156a90cf0e378df759364936c1781f1a25ef80')
b2sums=('4a5b1d6c1cb2c81186f1d1347aee2e78b8634e0db08053a99a10d54df31d2afa5982d64b49a351aea99fc9db64f8ab81adeab9ae427442892774f99de3602230')

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
    # TODO: build with UCC: https://github.com/openucx/ucc
    --with-cuda=/opt/cuda
    # this tricks the configure script to look for /usr/lib/pkgconfig/cuda.pc
    # instead of /opt/cuda/lib/pkgconfig/cuda.pc
    --with-cuda-libdir=/usr/lib
    --with-rocm=/opt/rocm
    # all components that link to CUDA or ROCm libraries should be run-time loadable
    --enable-mca-dso=accelerator_cuda,rcache_gpusm,rcache_rgpusm,accelerator_rocm
    --with-ofi=/usr
    --with-hwloc=external
    --with-libevent=external
    --with-pmix=external
    --with-prrte=external
    --with-valgrind
  )
  cd $_pkgname-$pkgver

  # set FCFLAGS for CET support in gfortran
  export FCFLAGS=${CFLAGS/ -Wformat -Werror=format-security/}

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
