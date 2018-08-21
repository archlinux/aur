# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=hdf-eos2
pkgver=2.20
pkgrel=3
pkgdesc="The HDF-EOS v2 is a software library designed built on HDF4 to support EOS-specific data structures, namely Grid, Point, and Swath."
url="http://www.hdfeos.org/software/library.php"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libaec' 'hdf5' 'hdf4' 'gdal' 'hdf-eos-common')
options=('libtool' 'staticlibs')
source=("ftp://edhs1.gsfc.nasa.gov/edhs/hdfeos/latest_release/HDF-EOS${pkgver}v1.00.tar.Z"
        "szip_cc.patch")
md5sums=('4697174a9296aa3d921915b75b3362d1'
         'f4bf627e4dedaae3f142ca05253743eb')

build() {
  cd hdfeos
  
  patch -p1 -i ../szip_cc.patch

  ./configure CC=/usr/bin/h5cc \
    --with-hdf5=/usr \
    --with-hdf4=/opt/hdf4 \
    --with-zlib=/usr \
    --with-szlib=/usr \
    --prefix=/usr \
    --disable-static \
    --enable-static=no \
    --enable-hl \
    --enable-threadsafe \
    --enable-linux-lfs \
    --enable-production=yes \
    --enable-parallel=yes \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --with-pthread=/usr/lib/ \
    --enable-install-include \
    --enable-cxx \
    --disable-sharedlib-rpath

  make
}

package() {
  cd hdfeos
  make DESTDIR=$pkgdir install

  #install example
  install -d -m755 $pkgdir/usr/share/doc/hdf-eos2
  install -m644 samples/* $pkgdir/usr/share/doc/hdf-eos2/

  # delete common files
  rm $pkgdir/usr/include/{cfortHdf.h,cproj.h,ease.h,isin.h,proj.h,bcea.h,cproj_prototypes.h,gctp_prototypes.h}
  
  rm $pkgdir/usr/lib/libGctp.a
  rm $pkgdir/usr/lib/libGctp.la
}
