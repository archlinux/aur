# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_pkgname=openmpi
pkgname=openmpi-ucx
pkgver=5.0.0
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
sha256sums=('9d845ca94bc1aeb445f83d98d238cd08f6ec7ad0f73b0f79ec1668dbfdacd613')
b2sums=('d6277714945ee7e82649cc450253b9cad642ab5b5d00b5c1d77ab4c07329148e940038c34c46d92e01f2b1bb7768effb6e95ad34aa509b3287582683e09f669a')

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
