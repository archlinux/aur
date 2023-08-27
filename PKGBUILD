# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_pkgname=openmpi
pkgname=openmpi-ucx
pkgver=4.1.5
pkgrel=3
pkgdesc='High performance message passing library (MPI)'
arch=(x86_64)
url='https://www.open-mpi.org'
license=('custom:OpenMPI')
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
  inetutils
  valgrind
)
optdepends=(
  'cuda: cuda support'
  'gcc-fortran: fortran support'
  'perl: for aggregate_profile.pl and profile2mat.pl'
)
provides=(
  $_pkgname
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
conflicts=($_pkgname)
source=(
  https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/$_pkgname-$pkgver.tar.bz2
  $_pkgname-4.1.5-openpmix_4.2.3.patch
)
sha256sums=('a640986bc257389dd379886fdae6264c8cfa56bc98b71ce3ae3dfbd8ce61dbe3'
            '46edac3dbf32f2a611d45e8a3c8edd3ae2f430eec16a1373b510315272115c40')
b2sums=('135a8373ed6173b7a94def18e3b964c6b6050c909382e0dbb1898a6d261ae428931358121ef6d325d303f4f510017a94970f7c66b280a5fc460365821f36dece'
        '1268d65f5e521bd466d6bcf92b5920919a0374d985c57e9268ea6db50175fd4646751e3bd73215fbd6d22fed52bdb15e8db58c121adba7dc87c6b81e53c48c15')

prepare() {
  # fix issues with openpmix 4.2.3: https://github.com/open-mpi/ompi/issues/10416
  # backport of https://github.com/open-mpi/ompi/pull/11472
  patch -Np1 -d $_pkgname-$pkgver -i ../$_pkgname-4.1.5-openpmix_4.2.3.patch
}

build() {
  local configure_options=(
    --prefix=/usr
    --enable-builtin-atomics
    --enable-memchecker
    --enable-mpi-cxx
    --enable-mpi-fortran=all
    --enable-pretty-print-stacktrace
    --libdir=/usr/lib
    --sysconfdir=/etc/$_pkgname
    --with-cuda=/opt/cuda
    --with-hwloc=external
    --with-libevent=external
    --with-pmix=external
    --with-valgrind
  )
  cd $_pkgname-$pkgver

  # TODO: depend on prrte with openmpi >= 5
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
