# Maintainer (Arch): Allan McRae <allan@archlinux.org>
# Maintainer: André Silva <emulatorman@riseup.net>
# Maintainer: Márcio Silva <coadde@riseup.net>
# Maintainer: Luke R. <g4jc@openmailbox.org>

pkgname=xtensa-unknown-elf-gcc
pkgver=6.3.0
_pkgverpatch=6.2.1
_pkgver=6
_islver=0.16.1
pkgrel=2
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="https://gcc.gnu.org"
makedepends=('binutils>=2.28' 'libmpc' 'gcc-ada' 'doxygen')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs')
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.bz2{,.sig}
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        https://repo.hyperbola.info:50000/other/gcc/$_pkgverpatch/gcc-xtensa.patch
        fix-ubsan-defref.patch)
validpgpkeys=('33C235A34C46AA3FFB293709A328C3A2C3C45C06') # Jakub Jelinek <jakub@redhat.com> # Note: (Weak DSA) :(
sha512sums=('234dd9b1bdc9a9c6e352216a7ef4ccadc6c07f156006a59759c5e0e6a69f0abcdc14630eff11e3826dd6ba5933a8faa43043f3d1d62df6bd5ab1e82862f9bf78'
            'SKIP'
            'c188667a84dc5bdddb4ab7c35f89c91bf15a8171f4fcaf41301cf285fb7328846d9a367c096012fec4cc69d244f0bc9e95d84c09ec097394cd4093076f2a041b'
            '7637408259cef4b14a2f41690bbc769ad0dc6cf4d1c782405526aeb58f68193269af6882b23fb57c3521174e45709ed2d54f0af1f835646e70a3bfd9f626aad9'
            '85402b4bce543e6ba996f6fd99bcefac59ffeb1c1f8ab53c015686f5e1ea447ffeab5f1df1847b7952ad38306b43302d8e23859a614b6ccc62e0fc1f07538dca')

# gcc-6.0 forces a changed triplet - need to address in pacman/devtools
[[ $CARCH == "x86_64" ]] && CHOST=x86_64-pc-linux-gnu

_libdir="usr/lib/gcc/xtensa-unknown-elf/$pkgver"

prepare() {
  cd ${srcdir}/gcc-$pkgver

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # Fix comparison between pointer and integer
  patch -p1 -i ${srcdir}/fix-ubsan-defref.patch

  # open-ath9k-htc-firmware patch
  patch -p1 -i ${srcdir}/gcc-xtensa.patch

  mkdir ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  # --disable-linker-build-id: https://bugs.archlinux.org/task/34902

  ${srcdir}/gcc-$pkgver/configure --prefix=/usr \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,lto \
      --enable-shared \
      --enable-threads=posix \
      --enable-libmpx \
      --with-system-zlib \
      --with-isl \
      --enable-__cxa_atexit \
      --disable-libunwind-exceptions \
      --enable-clocale=gnu \
      --disable-libstdcxx-pch \
      --disable-libssp \
      --enable-gnu-unique-object \
      --disable-linker-build-id \
      --enable-lto \
      --enable-plugin \
      --enable-install-libiberty \
      --with-linker-hash-style=gnu \
      --enable-gnu-indirect-function \
      --disable-multilib \
      --disable-werror \
      --enable-checking=release \
      --disable-nls \
      --target=xtensa-unknown-elf
  make all-gcc
}

package() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends"
  depends=("xtensa-unknown-elf-binutils>=2.28" 'libmpc')
  groups=('cross-devel')
  options=('staticlibs')

  cd ${srcdir}/gcc-build

  make -C gcc DESTDIR=${pkgdir} install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 gcc/gcov $pkgdir/usr/bin/xtensa-unknown-elf-gcov
  install -m755 -t $pkgdir/${_libdir}/ gcc/{cc1,cc1plus,collect2,lto1}

  make DESTDIR=${pkgdir} install-fixincludes
  make -C gcc DESTDIR=${pkgdir} install-mkheaders
  make -C lto-plugin DESTDIR=${pkgdir} install

  make -C gcc DESTDIR=${pkgdir} install-man

  make -C libcpp DESTDIR=${pkgdir} install
  make -C gcc DESTDIR=${pkgdir} install-po

  # many packages expect this symlink
  ln -s xtensa-unknown-elf-gcc ${pkgdir}/usr/bin/xtensa-unknown-elf-cc

  # POSIX conformance launcher scripts for c89 and c99
  cat > $pkgdir/usr/bin/xtensa-unknown-elf-c89 <<"EOF"
#!/bin/sh
fl="-std=c89"
for opt; do
  case "$opt" in
    -ansi|-std=c89|-std=iso9899:1990) fl="";;
    -std=*) echo "`basename $0` called with non ANSI/ISO C option $opt" >&2
	    exit 1;;
  esac
done
exec gcc $fl ${1+"$@"}
EOF
sed -i "s|exec gcc|exec xtensa-unknown-elf-gcc|" $pkgdir/usr/bin/xtensa-unknown-elf-c89

  cat > $pkgdir/usr/bin/xtensa-unknown-elf-c99 <<"EOF"
#!/bin/sh
fl="-std=c99"
for opt; do
  case "$opt" in
    -std=c99|-std=iso9899:1999) fl="";;
    -std=*) echo "`basename $0` called with non ISO C99 option $opt" >&2
	    exit 1;;
  esac
done
exec gcc $fl ${1+"$@"}
EOF
sed -i "s|exec gcc|exec xtensa-unknown-elf-gcc|" $pkgdir/usr/bin/xtensa-unknown-elf-c99

  chmod 755 $pkgdir/usr/bin/xtensa-unknown-elf-c{8,9}9

  # Remove man documents that conflict with host version
  rm -rf ${pkgdir}/usr/share/man/man7

  # Remove unused dirs
  rmdir ${pkgdir}/usr/{include,share/info}
}
