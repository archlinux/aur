# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=openmpi4
_pkgname=openmpi
pkgver=4.1.6
pkgrel=4
pkgdesc='High performance message passing library (MPI)'
arch=(x86_64)
url='https://www.open-mpi.org'
license=('custom:OpenMPI')
provides=('openmpi')
conflicts=('openmpi')
depends=(
  gcc-libs
  glibc
  hwloc
  libevent
  libnl
  openpmix
  openssh
  zlib
)
makedepends=(
  cuda
  gcc-fortran
  valgrind
)
optdepends=(
  'cuda: cuda support'
  'gcc-fortran: fortran support'
  'perl: for aggregate_profile.pl and profile2mat.pl'
)
provides=(
  libmca_common_cuda.so
  libmca_common_monitoring.so
  libmca_common_ompio.so
  libmca_common_sm.so
  libmpi.so
  libmpi_cxx.so
  libmpi_mpifh.so
  libmpi_usempi_ignore_tkr.so
  libmpi_usempif08.so
  libompitrace.so
  libopen-pal.so
  libopen-rte.so
)
source=("https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/$_pkgname-$pkgver.tar.bz2"
        'mca-mtl_ofi.diff'
        'test-datatype.diff')
sha256sums=('f740994485516deb63b5311af122c265179f5328a0d857a567b85db00b11e415'
            'b144d5db717dbc5af2fdc4e149b9db6fd4b905c1706c9da9ded7a133af65fae3'
            'b34e94413142508b2767102e40cbd44b5d71e73ce549db9429d1986e639c7ed5')

prepare() {
  cd $_pkgname-$pkgver
  patch -p 1 -i ../mca-mtl_ofi.diff
  patch -p 1 -i ../test-datatype.diff
}

build() {
  local configure_options=(
    --prefix=/usr
    --enable-builtin-atomics
    --enable-man-pages
    --enable-memchecker
    --enable-mpi-cxx
    --enable-mpi-fortran=all
    --enable-pretty-print-stacktrace
    --libdir=/usr/lib
    --sysconfdir=/etc/$pkgname
    --with-cuda=/opt/cuda
    --with-hwloc=external
    --with-libevent=external
    --with-pmix=external
    --with-valgrind
  )
  cd $_pkgname-$pkgver

  # set environment variables for reproducible build
  # see https://github.com/open-mpi/ompi/blob/main/docs/release-notes/general.rst
  export HOSTNAME=buildhost
  export USER=builduser

  # TODO: depend on prrte with openmpi >= 5
  # TODO: remove ac_cv_func_sem_open=no when there is a glibc release fixing https://sourceware.org/bugzilla/show_bug.cgi?id=30789
  ac_cv_func_sem_open=no ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
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
