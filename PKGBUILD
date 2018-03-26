# Maintainer: Michele Mocciola <mickele>

pkgname=hdf5-salome
_pkgname=hdf5
pkgver=1.8.20
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="General purpose library and file format for storing scientific data. This version is specifically compiled to be linked angains salome-platform."
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh')
provides=('hdf5_18')
conflicts=('hdf5_18')
makedepends=('time')
source=(https://support.hdfgroup.org/ftp/HDF5/current18/src/$_pkgname-$pkgver.tar.bz2)
sha512sums=(288e4772a946d406de9096843c92dd6874a0753ed6fbe859aaadf565aa0509fc612ebdb00c301b7955bc0dc63e45f3a224c6b2638f480fe6738ee0c96a993c6e)

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-static \
    --enable-hl \
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
  cd "$srcdir/${_pkgname}-${pkgver}"

  make -j`nproc` DESTDIR="${pkgdir}" install

  # don't install examples
  rm -rf "${pkgdir}"/usr/share/hdf5_examples

  # rename executables to not conflict with hdf5 package
  for file in "${pkgdir}"/usr/bin/*; do
    mv "${file}" "${file}"_18
  done

  # add hdf5 library path to dynamic linker configuration include directory
  install -dm 755 $pkgdir/etc/ld.so.conf.d
  echo /usr/lib/hdf5_18 >> $pkgdir/etc/ld.so.conf.d/hdf5_18.conf

  # install license
  install -Dm 644 $srcdir/$_pkgname-$pkgver/COPYING \
                  $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
