# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=gnat_util
pkgver=5.1.0
pkgrel=1
pkgdesc="Provides internal GNAT compiler components in a library which is used by (at least) ASIS and GNATColl."

_islver=0.12.2
_cloogver=0.18.1
_snapshot=5.2-20150721
_basedir=gcc-5-20150721
options=('!emptydirs')

arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gnatutil"
license=('GPL V3.0 without any Runtime Exception')

depends=('gcc-ada') #  'xmlada' 'gprbuild')
makedepends=('binutils>=2.25' 'libmpc' 'gcc-ada')



source=(http://sourceforge.net/projects/gnatutil/files/5.1.0/gnat_util-5.1.0.tar.gz
        http://ftp.tsukuba.wide.ad.jp/software/gcc/snapshots/5-20150721/gcc-5-20150721.tar.bz2        
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz)

md5sums=('4a7a6642bc5c3dfe67bfacf2d14206cc'
         '2d9478d69f566492175a5b7af6d8dd25'
         'e039bfcfb6c2ab039b8ee69bf883e824'
         'e34fca0540d840e5d0f6427e98c92252')


prepare() {
  cd ${srcdir}/${_basedir}

  # link isl/cloog for in-tree builds
  ln -s ../isl-${_islver} isl
  ln -s ../cloog-${_cloogver} cloog

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  echo 5.2.0 > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir ${srcdir}/gcc-build
}



build() 
{
  ## Build gcc-ada (note: much of this section is derived from the gcc-ada PKGBUILD).
  #

  cd ${srcdir}/gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  ${srcdir}/${_basedir}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=ada \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-cloog-backend=isl \
      --enable-lto --enable-plugin --enable-install-libiberty \
      --with-linker-hash-style=gnu \
      --disable-multilib --disable-werror \
      --enable-checking=release
  make -j7


  ## Build gnat util.
  #

  cd "$srcdir/$pkgname-$pkgver"

  export GCC_SRC_BASE="$srcdir/gcc-5-20150721"
  export GCC_BLD_BASE="$srcdir/gcc-build"

  make
}



package() 
{
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr"  install
}


