# Maintainer: Michele Mocciola <mickele>

pkgname=hdf5-salome
_pkgname=hdf5
pkgver=1.8.19
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="General purpose library and file format for storing scientific data. This version is specifically compiled to be linked angains salome-platform."
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh')
provides=('hdf5_18')
conflicts=('hdf5_18')
makedepends=('time')
source=("ftp://ftp.hdfgroup.org/HDF5/releases/hdf5-${pkgver:0:3}/hdf5-${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2")

build() {
  cd "$srcdir/${_pkgname}-${pkgver/_/-}"

  ./configure --prefix=/usr --disable-static \
    --enable-hl \
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

md5sums=('6f0353ee33e99089c110a1c8d2dd1b22')
