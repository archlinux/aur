# Maintainer: Angel de Vicente <angel.vicente.garrido at gmail dot com>
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: richli

pkgname=hdf-eos5
pkgver=1.16
pkgrel=2
pkgdesc="The HDF-EOS5 is a software library designed built on HDF5 to support the same Grid/Point/Swath functionality in HDF-EOS 2 and to the extent possible it will be built with the same calling sequences as the original HDF-EOS 2 library."
url="http://www.hdfeos.org/software/library.php"
license=('GPL')
arch=('i686' 'x86_64')
depends=('zlib' 'libaec' 'hdf5' 'gdal' 'hdf-eos-common')
options=('libtool' 'staticlibs')
source=("https://git.earthdata.nasa.gov/rest/git-lfs/storage/DAS/hdfeos5/7054de24b90b6d9533329ef8dc89912c5227c83fb447792103279364e13dd452?response-content-disposition=attachment%3B%20filename%3D%22HDF-EOS5.1.16.tar.Z%22%3B%20filename*%3Dutf-8%27%27HDF-EOS5.1.16.tar.Z"
        "szip_cc.patch")
sha256sums=('7054de24b90b6d9533329ef8dc89912c5227c83fb447792103279364e13dd452'
            '7d9d204090cb4b5faeaea6075a4d0103cbd79da3bc154466b2108a05627e2517')


build() {
  cd "hdfeos5"
  
  patch -p1 -i ../szip_cc.patch
  
  ./configure CC=/usr/bin/h5cc --with-hdf5=/usr --with-zlib=/usr --prefix=/usr \
    --disable-static \
    --enable-static=no \
    --with-szlib=/usr \
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
  #make check
}

package() {
  cd "hdfeos5"
  make DESTDIR="$pkgdir" install
  
  # delete common files
  rm "$pkgdir"/usr/include/{cfortHdf.h,cproj.h,ease.h,isin.h,proj.h,bcea.h,cproj_prototypes.h,gctp_prototypes.h}
  
  #install example
  install -d -m755 "$pkgdir/usr/share/doc/hdf-eos5"
  install -m644 samples/* "$pkgdir/usr/share/doc/hdf-eos5/"
}
