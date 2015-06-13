# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=hdf-eos2
pkgver=2.19
pkgrel=3
pkgdesc="The HDF-EOS2 is a software library designed built on HDF4 to support EOS-specific data structures, namely Grid, Point, and Swath."
url="http://www.hdfeos.org/software/library.php"
license=('GPL')
arch=('i686' 'x86_64')
depends=('szip' 'hdf5' 'hdf4-nonetcdf' 'gdal' 'hdf-eos-common')
options=('libtool' 'staticlibs')
source=(ftp://edhs1.gsfc.nasa.gov/edhs/hdfeos/latest_release/HDF-EOS${pkgver}v1.00.tar.Z)
md5sums=('b8648484fc78a2db7073dd603f3fb251')

build() {
  cd $srcdir/hdfeos
  #sed -i '/LIBS="-ljpeg/d' configure
  #export LDFLAGS="-lhdfeos -lGctp -lmfhdf -ldf -ljpeg -lz -lm -lsz"
  export LDFLAGS="-lmfhdf -ldf -ljpeg -lz -lm -lsz"

  export CFLAGS="${CFLAGS/O2/O0}"
  export CXXFLAGS="${CFLAGS}"
  export CC="/usr/bin/h5cc"
  #export CPPFLAGS="-Df2cFortran -I/usr/include"
  
  ./configure CC=/usr/bin/h5cc --with-hdf5=/usr --with-zlib=/usr --prefix=/usr \
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
  cd $srcdir/hdfeos
  make DESTDIR=$pkgdir install

  #install example
  install -d -m755 $pkgdir/usr/share/doc/hdf-eos2
  install -m644 samples/* $pkgdir/usr/share/doc/hdf-eos2/

  # delete common files
  rm $pkgdir/usr/include/{cfortHdf.h,cproj.h,ease.h,isin.h,proj.h,bcea.h,cproj_prototypes.h,gctp_prototypes.h}
  
  rm $pkgdir/usr/lib/libGctp.a
  rm $pkgdir/usr/lib/libGctp.la
}
