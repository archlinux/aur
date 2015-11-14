# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=hdf5-fortran-openmpi
_pkgname=hdf5
pkgver=1.8.16
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="General purpose library and file format for storing scientific data"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh' 'gcc-libs' 'openmpi')
makedepends=('time' 'gcc-fortran')
conflicts=('hdf5')
provides=('hdf5')
source=(ftp://ftp.hdfgroup.org/HDF5/current/src/${_pkgname}-${pkgver/_/-}.tar.bz2)
sha1sums=('a7b631778cb289edec670f665d2c3265983a0d53')

build() {
  cd "$srcdir/${_pkgname}-${pkgver/_/-}"
  export CFLAGS="${CFLAGS/O2/O0}"
  export CXXFLAGS="${CFLAGS}"
  ./configure \
    CC="mpicc" \
    FC="mpif90" \
    F9X="mpif90" \
    RUNPARALLEL="mpirun" \
    --prefix=/usr \
    --with-pthread=/usr/lib/ \
    --disable-static \
    --enable-hl \
    --enable-shared \
    --enable-fortran \
    --enable-fortran2003 \
    --enable-parallel \
    --enable-linux-lfs \
    --enable-production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --disable-sharedlib-rpath
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver/_/-}"

  make -j1 DESTDIR="${pkgdir}" install

  install -d -m755 "$pkgdir/usr/share/licenses/${pkgname}"
  install -m644 "$srcdir/${_pkgname}-${pkgver/_/-}/COPYING" \
          "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
