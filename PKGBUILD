# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=hdf5_18
pkgver=1.8.20
pkgrel=4
arch=(i686 x86_64)
pkgdesc='General purpose library and file format for storing scientific data'
url=https://support.hdfgroup.org/HDF5/
license=(custom)
depends=(zlib sh)
makedepends=(time)
source=(https://support.hdfgroup.org/ftp/HDF5/current18/src/hdf5-$pkgver.tar.bz2)
sha512sums=(288e4772a946d406de9096843c92dd6874a0753ed6fbe859aaadf565aa0509fc612ebdb00c301b7955bc0dc63e45f3a224c6b2638f480fe6738ee0c96a993c6e)

build() {
  cd hdf5-$pkgver
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
  make
}

package() {
  cd hdf5-$pkgver
  make DESTDIR=$pkgdir install
  # Rename executables so they don't conflict with the hdf5 package
  for file in $pkgdir/usr/bin/*; do mv $file ${file}_18; done
  install -d $pkgdir/{etc/ld.so.conf.d,usr/share/doc/hdf5_18}
  # Add library path to dynamic linker config includes
  echo /usr/lib/hdf5_18 > $pkgdir/etc/ld.so.conf.d/hdf5_18.conf
  mv $pkgdir/usr/share/{hdf5_examples,doc/hdf5_18/examples}
  install -Dm 644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
