# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: richli

pkgname=hdf-eos5
pkgver=1.15
pkgrel=5
pkgdesc="The HDF-EOS is a software library designed built on HDF5 to support the same Grid/Point/Swath functionality in HDF-EOS 2 and to the extent possible it will be built with the same calling sequences as the original HDF-EOS 2 library."
url="http://www.hdfeos.org/software/library.php"
license=('GPL')
arch=('i686' 'x86_64')
depends=('szip' 'hdf5-cpp-fortran' 'gdal' )
options=('libtool' 'staticlibs')
source=(ftp://edhs1.gsfc.nasa.gov/edhs/hdfeos5/latest_release/HDF-EOS5.$pkgver.tar.Z 'patches.tar.gz')
md5sums=('5d607a13dd42e559bfc90e278a8ec919'
         'e65fffc8956e953f37a767ce9782b592')

prepare() {
  cd "$srcdir/hdfeos5"
  # patches
  #patch -Np1 --ignore-whitespace -i ../patches/pthreads.patch
  patch -Np1 --ignore-whitespace -i ../patches/pkg-config.patch
  patch -Np1 --ignore-whitespace -i ../patches/configure.patch
  patch -Np1 --ignore-whitespace -i ../patches/gctp_remove.patch
  patch -Np1 --ignore-whitespace -i ../patches/libtool_fixes.patch
  patch -Np1 --ignore-whitespace -i ../patches/hdf5_transition.patch
  patch -Np1 --ignore-whitespace -i ../patches/hdf_hl.patch
  #patch -Np1 --ignore-whitespace -i ../patches/strcpy-overlap.patch
  patch -Np1 --ignore-whitespace -i ../patches/fix_HE5_EHHEisHE5.patch
  patch -Np1 --ignore-whitespace -i ../patches/hdf5_1.10.patch
}

build() {
  cd "$srcdir/hdfeos5"
  #export LDFLAGS="-lhe5_hdfeos -lGctp -lhdf5_hl -lhdf5 -ljpeg -lz -lsz -lm"
  export LDFLAGS="-lhdf5_hl -lhdf5 -ljpeg -lz -lsz -lm"

  export CFLAGS="-D_HDFEOS5_THREADSAFE ${CFLAGS/O2/O0}"
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
  #make check
}

package() {
  cd "$srcdir/hdfeos5"
  make DESTDIR="$pkgdir" install
  
  # delete common files
  rm "$pkgdir"/usr/include/{cfortHdf.h,cproj.h,ease.h,isin.h,proj.h,bcea.h,cproj_prototypes.h,gctp_prototypes.h}
  
  #install example
  install -d -m755 "$pkgdir/usr/share/doc/hdf-eos5"
  install -m644 samples/* "$pkgdir/usr/share/doc/hdf-eos5/"
}
