# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=blasr-git
pkgver=r122.9593a09
pkgrel=1
pkgdesc="The PacBio long read aligner"
arch=('i686' 'x86_64')
url="https://github.com/PacificBiosciences/blasr"
license=('custom')
depends=('hdf5-cpp-fortran')
makedepends=('python2')
conflicts=('blasr')
provides=('blasr')

source=("$pkgname::git+https://github.com/PacificBiosciences/blasr")

md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname

  git submodule init
  git submodule update

  sed -e 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
      -i configure.py \
         libcpp/configure.py

  # we want to link against shared libs
  sed -e 's|LDFLAGS   := $(LDFLAGS1) $(HDF5_LIB)/libhdf5_cpp.a $(HDF5_LIB)/libhdf5.a -lpthread -lz -ldl|LDFLAGS   += $(LDFLAGS1) -lhdf5_cpp -lhdf5 -lpthread -lz -ldl|' \
      -i libcpp/unittest/normal.defines.mk \
         libcpp/unittest/common.mk

  sed -e 's|DEP_LIBS += ${LIBPBDATA_LIB} ${HDF5_LIB} ${PBBAM_LIB} ${HTSLIB_LIB} ${ZLIB_LIB}|DEP_LIBS += ${LIBPBDATA_LIB} ${PBBAM_LIB} ${HTSLIB_LIB} ${ZLIB_LIB}|' \
      -i libcpp/alignment/makefile \
         libcpp/hdf/makefile
}

build() {
  cd $srcdir/$pkgname

  export NOPBBAM=
  export HDF5_INCLUDE=/usr/include
  export HDF5_LIB=/usr/lib

  cd libcpp

  ./configure.py \
    --no-pbbam \
    --submodules \
    --shared

  make

  cd ..

  ./configure.py \
    --no-pbbam \
    --submodules \
    --shared

  make
}

package() {
  cd $srcdir/$pkgname

  for file in blasr utils/loadPulses utils/pls2fasta utils/samFilter utils/samtoh5 utils/samtom4 utils/sawriter utils/sdpMatcher utils/toAfg ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file)
  done

  for file in libcpp/pbdata/libpbdata.so libcpp/hdf/libpbihdf.so libcpp/alignment/libblasr.so ; do
    install -Dm755 $file $pkgdir/usr/lib/$(basename $file)
  done

  install -Dm644 LICENSES.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
