# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=blasr-git
pkgver=r70.463a369
pkgrel=1
pkgdesc="The PacBio long read aligner"
arch=('i686' 'x86_64')
url="https://github.com/PacificBiosciences/blasr"
license=('custom')
depends=('hdf5-cpp-fortran')

source=("$pkgname::git+https://github.com/PacificBiosciences/blasr")

md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname

  # with the git@github.com: url you would need to have both a github account and have set it up for ssh
  # so we use https instead
  sed -e 's|git@github.com:|https://github.com/|' \
      -i .gitmodules

  git submodule init
  git submodule update

  # otherwise there would be this error:
  # Makefile:42: *** recipe commences before first target.  Stop.
  sed -e 's|    INCLUDES +=|\tINCLUDES +=|' \
      -i libcpp/pbdata/Makefile

  # we want to link against shared libs
  sed -e 's|LDFLAGS   := $(LDFLAGS1) $(HDF5_LIB)/libhdf5_cpp.a $(HDF5_LIB)/libhdf5.a -lpthread -lz -ldl|LDFLAGS   += $(LDFLAGS1) -lhdf5_cpp -lhdf5 -lpthread -lz -ldl|' \
      -e 's|LIBS += $(HDF5_LIB)/libhdf5_cpp.a $(HDF5_LIB)/libhdf5.a|LIBS += -lhdf5_cpp -lhdf5|' \
      -i common.mk \
         libcpp/unittest/common.mk

  # don't link statically
  sed -e 's|-static||' \
      -i common.mk
}

build() {
  cd $srcdir/$pkgname

  make HDF5_LIB=/usr/lib HDF5_INC=/usr/include ZLIB_ROOT=/usr
}

package() {
  cd $srcdir/$pkgname

  for file in blasr utils/loadPulses utils/pls2fasta utils/samFilter utils/samtoh5 utils/samtom4 utils/sawriter utils/sdpMatcher utils/toAfg ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file)
  done

  install -Dm644 <(echo unknown) $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
