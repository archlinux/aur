# $Id: PKGBUILD 283109 2016-12-13 19:50:44Z arojas $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=hdf5_18
_pkgname=hdf5
pkgver=1.8.18
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="General purpose library and file format for storing scientific data"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh')
makedepends=('time')
source=(https://support.hdfgroup.org/ftp/HDF5/current18/src/${_pkgname}-${pkgver/_/-}.tar.bz2)
sha1sums=('d7e008cbfcf5cb6913b5327a81bbcaf34cc9436d')

build() {
  cd "$srcdir/${_pkgname}-${pkgver/_/-}"

  ./configure --prefix=/usr --disable-static \
    --disable-hl \
    --enable-threadsafe \
    --enable-linux-lfs \
    --enable-production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5_18/ \
    --with-pthread=/usr/lib \
    --disable-sharedlib-rpath \
    --libdir=/usr/lib/hdf5_18 \
    --includedir=/usr/include/hdf5_18
  make

}

package() {
  cd "$srcdir/${_pkgname}-${pkgver/_/-}"

  make -j1 DESTDIR="${pkgdir}" install

  # don't install examples
  rm -rf "${pkgdir}"/usr/share/hdf5_examples

  # rename executables to not conflict with hdf5 package
  for file in "${pkgdir}"/usr/bin/*; do
    mv "${file}" "${file}"_18
  done

  #
  install -d m755 "${pkgdir}"/etc/ld.so.conf.d
  echo /usr/lib/hdf5_18 >> "${pkgdir}"/etc/ld.so.conf.d/hdf5_18.conf

  # install license
  install -d -m755 "$pkgdir/usr/share/licenses/${pkgname}"
  install -m644 "$srcdir/${_pkgname}-${pkgver/_/-}/COPYING" \
          "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" 
 
}

