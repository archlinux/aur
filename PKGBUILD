# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Ruben Van Boxem <vanboxem.ruben@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=('gcc5')
pkgver='5.5.0'
_ver='5'
_islver='0.18'
pkgrel='3'
pkgdesc='The GNU Compiler Collection (5.x.x)'
arch=('i686' 'x86_64')
url='https://gcc.gnu.org/gcc-5/'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('glibc' 'binutils' 'libmpc')
options=('!emptydirs')
source=(
  "https://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
  "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
  'glibc2.28-ustat.patch'
  'glibc2.30-ipc_perm.patch'
)
md5sums=('0f70424213b4a1113c04ba66ddda0c1f'
         '11436d6b205e516635b666090b94ab32'
         '75b0fabc92d4e2735baa897f231e7d68'
         '04e73dd6a55a90a4fee9999a915580d3')
sha256sums=('530cea139d82fe542b358961130c69cfde8b3d14556370b65823d2f91f0ced87'
            '6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b'
            '335839750f0cf15ce0f6099673daf164db674c6442b00efcbc46c4f195cfa29d'
            '95d619636a2bae64acc01fdbe18ad61b4b0483217ee00eac372f0b0bec073f32')
sha512sums=('670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1'
            '85d0b40f4dbf14cb99d17aa07048cdcab2dc3eb527d2fbb1e84c41b2de5f351025370e57448b63b2b8a8cf8a0843a089c3263f9baee1542d5c2e1cb37ed39d94'
            '633d96bf2d78d3187d8b26dd4c12b1b8fcbe784cbaa6f3b312326dc4ea118b3f0980bfd0e50cd6be79563dd29c296a2fafe056f4dbbb486414331cebcc1109bf'
            '3ee444f026c746935aa21ca07201ecc742dd6a27a257ed37387b46e89257b43415a1f77a76ebefd569a35243ae4ce58282b04fec5090b7b58ddd9d52e4fdcd11')

prepare() {
  cd gcc-$pkgver

  # Fix build with glibc 2.28, which removes <sys/ustat.h>
  patch -p0 -i "$srcdir/glibc2.28-ustat.patch"
  patch -p0 -i "$srcdir/glibc2.30-ipc_perm.patch"

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  echo ${pkgver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir ${srcdir}/gcc-build
}

build() {
  cd gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  # This option exist in default makepkg.conf while it's not supported by gcc5
  CFLAGS=${CFLAGS/-fno-plt/}
  CXXFLAGS=${CXXFLAGS/-fno-plt/}

  ${srcdir}/gcc-$pkgver/configure --prefix=/usr \
      --build=${CHOST} \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,fortran,lto \
      --enable-shared --enable-threads=posix --enable-libmpx \
      --with-system-zlib --with-isl --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-lto --enable-plugin \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release \
      --program-suffix=-${_ver} \
      --enable-version-specific-runtime-libs

  # without LD_PRELOAD, the build fails for some people with:
  #    [Makefile:605: libstdc++.la] Error 139
  export LD_PRELOAD=/usr/lib/libstdc++.so
  make -s
}

package() {
  cd gcc-build

  make -s -j1 DESTDIR=${pkgdir} install

  # Lazy way of dealing with conflicting files...
  rm -rf ${pkgdir}/usr/share/{info,locale,man}

  # Move potentially conflicting stuff to version specific subdirectory
  [[ -d ${pkgdir}/usr/lib ]] && mv ${pkgdir}/usr/lib/lib* ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/
  [[ -d ${pkgdir}/usr/lib/gcc/${CHOST}/lib/ ]] && mv ${pkgdir}/usr/lib/gcc/${CHOST}/lib/lib* ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/

  # Install Runtime Library Exception
  install -Dm644 ${srcdir}/gcc-$pkgver/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}
