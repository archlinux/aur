# Maintainer (Arch): Allan McRae <allan@archlinux.org>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Maintainer: Márcio Silva <coadde@parabola.nu>

pkgname=xtensa-unknown-elf-gcc
pkgver=6.2.1
_pkgverpatch=$pkgver
_pkgver=6
_islver=0.16.1
pkgrel=1
_commit=c2103c17
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.26' 'libmpc' 'doxygen' 'git')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs')
source=(git://gcc.gnu.org/git/gcc.git#commit=${_commit}
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        https://repo.parabola.nu/other/gcc/$_pkgverpatch/gcc-xtensa.patch)
md5sums=('SKIP'
         'ac1f25a0677912952718a51f5bc20f32'
         '5e0f13db1555fd3f70da9642ab180386')

# gcc-6.0 forces a changed triplet - need to address in pacman/devtools
[[ $CARCH == "x86_64" ]] && CHOST=x86_64-pc-linux-gnu

_libdir="usr/lib/gcc/xtensa-unknown-elf/$pkgver"

prepare() {
  cd ${srcdir}/gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Parabola installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

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

  ${srcdir}/gcc/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --with-bugurl=https://labs.parabola.nu/ \
      --enable-languages=c,c++,lto \
      --enable-shared --enable-threads=posix --enable-libmpx \
      --with-system-zlib --with-isl --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-lto --enable-plugin --enable-install-libiberty \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release --disable-nls \
      --target=xtensa-unknown-elf
  make all-gcc
}

package() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends"
  depends=("xtensa-unknown-elf-binutils>=2.26" 'libmpc')
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
