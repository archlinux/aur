# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=openmpi
pkgver=4.1.3
pkgrel=1
pkgdesc='High performance message passing library (MPI)'
arch=(x86_64)
url='https://www.open-mpi.org'
license=('custom:OpenMPI')
# TODO: package and depend on https://github.com/openpmix/prrte
depends=(gcc-libs glibc hwloc libevent libnl openpmix zlib)
makedepends=(cuda gcc-fortran inetutils valgrind)
optdepends=(
  'cuda: cuda support'
  'gcc-fortran: fortran support'
  'openssh: for offloading to remote hosts'
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
options=(debug)
source=(https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/$pkgname-$pkgver.tar.bz2)
sha256sums=('3d81d04c54efb55d3871a465ffb098d8d72c1f48ff1cbaf2580eb058567c0a3b')
b2sums=('5148fe5fb68f7be32d6a76fa780b13e74f98621a001f860e92c0cba85b405f193f9afeeb9518cff8bbf57098cc813701fb3edda7061f557da7fa9cdcbc63c722')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-builtin-atomics \
    --enable-memchecker \
    --enable-mpi-cxx \
    --enable-mpi-fortran=all \
    --enable-pretty-print-stacktrace \
    --libdir=/usr/lib \
    --sysconfdir=/etc/$pkgname \
    --with-cuda=/opt/cuda \
    --with-hwloc=external \
    --with-libevent=external \
    --with-pmix=external \
    --with-valgrind \
    --without-slurm

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make V=1
}

check() {
  make check -C $pkgname-$pkgver
}

package() {
  depends+=(libpmix.so)

  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -Dm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
