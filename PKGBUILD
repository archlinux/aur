# Maintainer: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
# Prev-Maintainer: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
# Contributor: kristianlm2 <kristanlein@gmail.com>
# Contributor: progtologist <arissynod@gmail.com>

pkgname=gcc43
_ver=4.3
pkgver=4.3.6
pkgrel=8
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=('binutils' 'mpfr' 'cloog' 'zlib' 'elfutils')
makedepends=('setconf')
options=('!libtool' '!buildflags' 'staticlibs')

source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,g++,fortran,objc,java}-${pkgver}.tar.bz2
  gcc_pure64.patch
  siginfo_t_fix.patch)

md5sums=('43df9ad8b4bb314a46bac12f5aefaec2'
         'ee7dc01b6e1a6a92a6e8d66adb8d2ab9'
         'c6eeee73007015c52043716fbe8ffdc7'
         '3fdb8158eabb765d1711f894bf71f7f5'
         'b5c12ad38048c354686747d640f5d621'
         '4030ee1c08dd1e843c0225b772360e76'
         'edce21b2ce295478d14d5dd988eb3287')

prepare() {
  cd ${srcdir}/gcc-${pkgver}
  # Don't install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # Disables generating documentation (new texinfo does not like the old .texi files)
  echo "MAKEINFO = :" >> ${srcdir}/gcc-${pkgver}/Makefile.in

  patch -Np1 -i "$srcdir/siginfo_t_fix.patch"
  if [[ "$CARCH" == "x86_64" ]]; then
    patch -Np1 -i "$srcdir/gcc_pure64.patch"
  fi
  echo "$pkgver" > gcc/BASE-VER

  # Don't run fixincludes
  sed -i -e 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  rm -rf build
  mkdir build
}

build()
{
  cd ${srcdir}/gcc-${pkgver}/build
  ../configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --program-suffix=-${_ver} \
    --enable-shared \
    --enable-languages=c,c++ \
    --enable-__cxa_atexit \
    --disable-libstdcxx-pch \
    --disable-multilib \
    --enable-libgomp \
    --disable-libmudflap \
    --disable-libssp \
    --enable-clocale=gnu \
    --with-tune=generic \
    --with-cloog \
    --with-ppl \
    --with-system-zlib \
    --disable-werror
 #   --enable-checking=release \
  make || return 1

}

package() {
  cd "$srcdir/gcc-$pkgver/build"

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/share/man/man7"
  rm -rf "$pkgdir/usr/share/locale"
  mv "$pkgdir"/usr/lib/lib* \
     "$pkgdir/usr/lib/gcc/$CHOST/$pkgver/"

  # Create links for gcc-4.3 build environment (useful for CUDA)
  mkdir -p "$pkgdir/opt/gcc-$_ver"
  ln -s /usr/bin/gcc-4.3 "$pkgdir/opt/gcc-$_ver/gcc"
  ln -s /usr/bin/g++-4.3 "$pkgdir/opt/gcc-$_ver/g++"
  # Avoid file conflicts when enabling libgomp
  rm -rf "$pkgdir/usr/share/info"
}

