# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=hdf5-fortran-openmpi
_pkgname=hdf5
_patch=patch1
pkgver=1.10.0
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="General purpose library and file format for storing scientific data"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh' 'gcc-libs' 'openmpi')
makedepends=('time' 'gcc-fortran')
conflicts=('hdf5')
provides=('hdf5' 'hdf5-openmpi')
source=(ftp://ftp.hdfgroup.org/HDF5/releases/${_pkgname}-1.10/${_pkgname}-${pkgver}-${_patch}/src/${_pkgname}-${pkgver}-${_patch}.tar.bz2)
sha1sums=('2f34251186fa9e59887d8f094bc0bc90187d0aa4')

build() {
  cd "$srcdir/${_pkgname}-${pkgver/_/-}-${_patch}"
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
    --enable-build-mode=production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --disable-sharedlib-rpath
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver/_/-}-${_patch}"

  make -j1 DESTDIR="${pkgdir}" install

  install -d -m755 "$pkgdir/usr/share/licenses/${pkgname}"
  install -m644 "$srcdir/${_pkgname}-${pkgver/_/-}-${_patch}/COPYING" \
          "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
