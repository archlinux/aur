# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=hdf5_18
pkgver=1.8.21
pkgrel=1
arch=(i686 x86_64)
pkgdesc='General-purpose library and file format for storing scientific data (1.8 branch)'
url=https://www.hdfgroup.org
license=(custom)
depends=(zlib sh)
makedepends=(time)
source=(https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-$pkgver/src/hdf5-$pkgver.tar.gz)
sha512sums=(ec05c241ef61a0323cf3d46d0b0e624f80a68dd622d4a4f5841a079bdd11729606159024685336c17d381954fccfe85be41f2a862fd50b22d7bd4326884e610c)

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
    --docdir=/usr/share/doc/hdf5_18 \
    --with-pthread=/usr/lib \
    --disable-sharedlib-rpath \
    --libdir=/usr/lib/hdf5_18 \
    --includedir=/usr/include/hdf5_18
  make
}

package() {
  cd hdf5-$pkgver
  make DESTDIR="$pkgdir" install
  # Rename executables so they don't conflict with the hdf5 package
  for file in "$pkgdir"/usr/bin/*; do mv $file ${file}_18; done
  install -d "$pkgdir"/{etc/ld.so.conf.d,usr/share/doc/hdf5_18}
  # Add library path to dynamic linker config includes
  echo /usr/lib/hdf5_18 > "$pkgdir"/etc/ld.so.conf.d/hdf5_18.conf
  mv "$pkgdir"/usr/share/{hdf5_examples,doc/hdf5_18/examples}
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
