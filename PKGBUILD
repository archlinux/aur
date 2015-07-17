# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=blasr-git
pkgver=r98.caaf74a
pkgrel=1
pkgdesc="The PacBio long read aligner"
arch=('i686' 'x86_64')
url="https://github.com/PacificBiosciences/blasr"
license=('custom')
depends=('hdf5-cpp-fortran' 'htslib')
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
      -i libcpp/configure.py

  # we want to link against shared libs
  sed -e 's|LDFLAGS   := $(LDFLAGS1) $(HDF5_LIB)/libhdf5_cpp.a $(HDF5_LIB)/libhdf5.a -lpthread -lz -ldl|LDFLAGS   += $(LDFLAGS1) -lhdf5_cpp -lhdf5 -lpthread -lz -ldl|' \
      -e 's|LIBS += $(HDF5_LIB)/libhdf5_cpp.a $(HDF5_LIB)/libhdf5.a|LIBS += -lhdf5_cpp -lhdf5|' \
      -i common.mk \
         libcpp/unittest/common.mk

  # use system provided htslib
  sed -e 's|HTSLIB_INCLUDE    := $(PBBAM)/../htslib/htslib|HTSLIB_INCLUDE    := /usr/include|' \
      -e 's|HTSLIB_LIB    := $(PBBAM)/../htslib|HTSLIB_LIB    := /usr/lib|' \
      -e 's|$(HTSLIB_LIB)/libhts.a|$(HTSLIB_LIB)/libhts.so|' \
      -i common.mk

  # PBINCROOT fix
  sed -e '1 i top_srcdir := $(PWD)' \
      -e '1 i PBINCROOT := $(top_srcdir)/libcpp' \
      -i Makefile

  # moar PBINCROOT fixes
  sed -e '1 i PBINCROOT := ../libcpp' \
      -e 's|pblib: $(PBINCROOT)/Makefile|pblib: $(PBINCROOT)/makefile|' \
      -i utils/Makefile

  # this is neither included nor needed
  sed -e 's|-lpbbam||' \
      -i common.mk

  # don't link statically
  sed -e 's|-static||' \
      -i common.mk
}

build() {
  cd $srcdir/$pkgname

  make -j1 HDF5_LIB=/usr/lib/libhdf5.so HDF5_INC=/usr/include ZLIB_ROOT=/usr
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
