# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=gnat_util
pkgver=5.1.0
pkgrel=2
pkgdesc="Provides internal GNAT compiler components in a library which is used by (at least) ASIS and GNATColl."

_islver=0.15
_basedir=gcc-5.3.0

options=('!emptydirs')

arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gnatutil"
license=('GPL V3.0 without any Runtime Exception')

depends=('gcc-ada' 'xmlada' 'gprbuild' 'prepare_gnat_util')
makedepends=('binutils>=2.25' 'libmpc' 'gcc-ada' 'doxygen')



source=(http://sourceforge.net/projects/gnatutil/files/5.1.0/gnat_util-5.1.0.tar.gz
        ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/gcc-5.3.0.tar.bz2
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        pr66035.patch)

md5sums=('4a7a6642bc5c3dfe67bfacf2d14206cc'
         'c9616fd448f980259c31de613e575719'
         '8428efbbc6f6e2810ce5c1ba73ecf98c'
         '5b980076cd5fcbc3aff6014f306282dd')


prepare() 
{
  ## Prepare for gcc-ada build (note: much of this section is derived from the gcc PKGBUILD).
  #
  cd ${srcdir}/${_basedir}

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  echo 5.3.0 > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66035
#  patch -p1 -i ${srcdir}/pr66035.patch

  mkdir ${srcdir}/gcc-build 
}



build() 
{
  ## Build gcc-ada (note: much of this section is derived from the gcc PKGBUILD).
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
      --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ \
      --enable-shared --enable-threads=posix --enable-libmpx \
      --with-system-zlib --with-isl --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-lto --enable-plugin --enable-install-libiberty \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release
#      --with-default-libstdcxx-abi=gcc4-compatible

  make


  ## Build gnat util.
  #

  cd "$srcdir/$pkgname-$pkgver"

  export GCC_SRC_BASE="$srcdir/gcc-5.3.0"
  export GCC_BLD_BASE="$srcdir/gcc-build"

  make
}



package() 
{
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr"  install
}
