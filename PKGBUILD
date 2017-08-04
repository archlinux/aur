# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=hdf5_18
_pkgname=hdf5
pkgver=1.8.19
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="General purpose library and file format for storing scientific data"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh')
makedepends=('time')
source=(https://support.hdfgroup.org/ftp/HDF5/current18/src/$_pkgname-$pkgver.tar.bz2)
sha256sums=('59c03816105d57990329537ad1049ba22c2b8afe1890085f0c022b75f1727238')

build() {
  cd $srcdir/$_pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-static \
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

  make -j`nproc`
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  make -j`nproc` DESTDIR=$pkgdir install

  # don't install examples
  rm -rf $pkgdir/usr/share/hdf5_examples

  # rename executables to not conflict with hdf5 package
  for file in $pkgdir/usr/bin/*; do
    mv $file ${file}_18
  done

  # add hdf5 library path to dynamic linker configuration include directory
  install -dm 755 $pkgdir/etc/ld.so.conf.d
  echo /usr/lib/hdf5_18 >> $pkgdir/etc/ld.so.conf.d/hdf5_18.conf

  # install license
  install -Dm 644 $srcdir/$_pkgname-$pkgver/COPYING \
                  $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
