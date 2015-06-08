# Maintainer: Márcio Silva (Parabola) <coadde@parabola.nu>
# Maintainer (Arch): Allan McRae <allan@archlinux.org>

# toolchain build order: {kernel}-api-headers->glibc->binutils->gcc->binutils->glibc

# toolchain (for cross-compiler) build order:
#  {kernel}-api-headers(host system)->glibc(host system)
# ->binutils(host system)->gcc(host system)->binutils(host system)->glibc(host system)
# ->binutils(cross)->gcc(cross)
# ->kernel-api-headers(target system)->glibc(target system)
# ->binutils(target system)->gcc(target system)->binutils(target system)
# ->glibc(target system)

# NOTE: libtool requires rebuilt with each new gcc version

#--------------------------------------------------------------------------------
#  cross-compile table
#--------------------------------------------------------------------------------

# +-------------+-------------+-----------------------------------------------------------------------------------------------------+-----------+---------+
# | -march      | CARCH       | CTARGET (_CTARGET)                                                                                  | Multilib  | QEMU    |
# +-------------+-------------+-------------+-----------+---------------------------------------------------------------------------+-----------+---------+
# | _march      | CARCH       | _arch       | <machine> | _os_target (GNU/*)                                                        | _multilib | -       |
# +-------------+-------------+-------------+-----------+---------------------------------------------------------------------------+-----------+---------+
# | mips64el    | mips64el    | mips64el    | unknown   | {linux,kfreebsd,kopenbsd,knetbsd}-gnu|elf                                 | opt       | bin/sys |
# | mips64      | mips64      | mips64      | unknown   | {linux,kfreebsd,kopenbsd,knetbsd}-gnu|elf                                 | opt       | bin/sys |
# | *           | mipsel      | mipsel      | unknown   | {linux,kfreebsd,kopenbsd,knetbsd}-gnu|elf                                 | no        | bin/sys |
# | *           | mips        | mips        | unknown   | {linux,kfreebsd,kopenbsd,knetbsd}-gnu|elf                                 | no        | bin/sys |
# | x86_64      | x86_64      | x86_64      | unknown   | gnu<|{linux,kfreebsd,kopenbsd,knetbsd,kdragonflybsd,kopensolaris}-gnu|elf | yes       | bin/sys |
# | i[3-7]86    | i[3-7]86    | i[3-7]86    | pc        | gnu|{linux,kfreebsd,kopenbsd,knetbsd,kdragonflybsd,kopensolaris}-gnu|elf  | no        | bin/sys |
# | armv8-a     | aarch64     | aarch64     | unknown   | {linux,kfreebsd,kopenbsd,knetbsd,kopensolaris}-gnu|elf                    | yes       | -       |
# | armv8-a     | aarch64_be  | aarch64_be  | unknown   | {linux,kfreebsd,kopenbsd,knetbsd,kopensolaris}-gnu|elf                    | yes       | -       |
# | armv7-a     | armv7h      | armv7l      | unknown   | {linux,kfreebsd,kopenbsd,knetbsd,kopensolaris}-gnueabihf|elf              | no        | bin/sys |
# | armv6       | armv6h      | armv6l      | unknown   | {linux,kfreebsd,kopenbsd,knetbsd,kopensolaris}-gnueabihf|elf              | no        | bin/sys |
# | armv5te     | arm         | armv5tel    | unknown   | {linux,kfreebsd,kopenbsd,knetbsd,kopensolaris}-gnueabi                    | no        | bin/sys |
# | *           | arm         | arm         | unknown   | eabi                                                                      | no        | bin/sys |
# | arm         | armeb       | armeb       | unknown   | {linux,kfreebsd,kopenbsd,knetbsd}-gnueabi|eabi                            | no        | bin     |
# | sparc64     | sparc64     | sparc64     | unknown   | {linux,kfreebsd,kopenbsd,knetbsd,kopensolaris}-gnu                        | opt       | bin/sys |
# | sparc       | sparc       | sparc       | unknown   | {linux,kopenbsd,knetbsd,kopensolaris}-gnu                                 | no        | bin/sys |
# | -           | ia64        | ia64        | unknown   | {linux,kfreebsd,kopenbsd,knetbsd}-gnu                                     | yes       | -       |
# | -           | s390        | s390        | ibm       | linux-gnu                                                                 | no        | -       |
# | -           | s390x       | s390x       | ibm       | linux-gnu                                                                 | no        | bin/sys |
#v| powerpc64   | powerpc64   | powerpc64   | unknown   | {linux,kfreebsd,kopenbsd,knetbsd}-gnu{,eabi}|{elf,eabi}                   | opt       | bin/sys |x|eabi
#x| powerpc64le | powerpc64le | powerpc64le | unknown   | {linux,kfreebsd,kopenbsd,knetbsd}-gnu{,eabi}|{elf,eabi}                   | opt       | -       |
# | powerpc     | powerpc     | powerpc     | unknown   | {linux,kfreebsd,kopenbsd,knetbsd}-gnu{,eabi}|{elf,eabi}                   | no        | bin/sys |
# | powerpcle   | powerpcle   | powerpcle   | unknown   | {linux,kfreebsd,kopenbsd,knetbsd}-gnu{,eabi}|{elf,eabi}                   | no        | -       |
# | -           | spu         | spu         | unknown   | elf                                                                       | no        | -       |
# | -           | sh64        | sh64        | unknown   | {linux,kopenbsd,knetbsd}-gnu|elf                                          | opt       | -       |
# | -           | sh64le      | sh64le      | unknown   | {linux,kopenbsd,knetbsd}-gnu|elf                                          | opt       | -       |
# | -           | sh4         | sh4         | unknown   | {linux,kopenbsd,knetbsd}-gnu|elf                                          | no        | bin/sys |
# | -           | sh4le       | sh4le       | unknown   | {linux,kopenbsd,knetbsd}-gnu|elf                                          | no        | bin/sys |
# | -           | sh          | sh          | unknown   | {linux,kopenbsd,knetbsd}-gnu|elf                                          | no        | - @     |
# | -           | shle        | shle        | unknown   | {linux,kopenbsd,knetbsd}-gnu|elf                                          | no        | - @     |
# | -           | xtensa      | xtensa      | unknown   | elf                                                                       | no        | sys     |
# | *           | avr         | avr         | unknown   | elf                                                                       | no        | -       |
# | *           | m68k        | m68k        | unknown   | gnu|{linux,kopenbsd,knetbsd}-gnu|elf                                      | no        | bin/sys |
# | -           | lm32        | lm32        | unknown   | linux-gnu|elf                                                             | no        | sys     |
# | -           | or32        | or32        | unknown   | linux-gnu<|elf<                                                           | no        | bin/sys |x|linux-gnu
# +-------------+-------------+-------------+-----------+---------------------------------------------------------------------------+-----------+---------+

# For "Wine"
# +-------------+-------------+-------------+-----------+---------------------------------------------------------------------------+-----------+---------+
#i| *           | x86_64      | x86_64      | unknown   | mingw64                                                                   | yes       | bin/sys |
#i| *           | i[3-7]86    | i[3-7]86    | unknown   | mingw32                                                                   | no        | bin/sys |
#?| *           | aarch64     | aarch64     | unknown   | ???                                                                       | yes       | -       |
#?| *           | aarch64_be  | aarch64_be  | unknown   | ???                                                                       | yes       | -       |
#?| *           | armv7h      | armv7l      | unknown   | ???                                                                       | no        | bin/sys |
#?| *           | armv6h      | armv6l      | unknown   | ???                                                                       | no        | bin/sys |
#?| *           | arm         | armv5tel    | unknown   | ???                                                                       | no        | bin/sys |
#?| *           | armeb       | armeb       | unknown   | ???                                                                       | no        | bin     |
# +-------------+-------------+-------------+-----------+---------------------------------------------------------------------------+-----------+---------+

# For "DOSBox"
# +-------------+-------------+-------------+-----------+---------------------------------------------------------------------------+-----------+---------+
#i| *           | i386        | i386        | pc        | msdosdjgpp                                                                | no        | bin/sys |
# +-------------+-------------+-------------+-----------+---------------------------------------------------------------------------+-----------+---------+

# opt : Multilib is optional
# * : Any supported by architecture.
# - : None.
# @ : bin/sys (Only sh4 and sh4l support)
# < : experimental support. (future)

#--------------------------------------------------------------------------------
# options
#--------------------------------------------------------------------------------

# Hardware architecture:

# options: "same", "mips64el", "x86_64", "i686" or "xtensa"
_arch_target=xtensa

# OS target:

# system: <os> or <kernel>-<os>
# options: "gnu", "linux-gnu", "kfreebsd-gnu" or "elf"
_os_target=elf

#--------------------------------------------------------------------------------
# variables
#--------------------------------------------------------------------------------

# set the default values if it's not added
[[ -z $_arch_target ]] && _arch_target=same
[[ -z $_os_target ]] && _os_target=linux-gnu

# set the value on _arch variable 
if [[ $_arch_target == same ]]; then
  _arch=$CARCH
else
  _arch=$_arch_target
fi

# set the value on _target variable
if [[ $_arch == i686 ]]; then
  _target=$_arch-pc-$_os_target
else
  _target=$_arch-unknown-$_os_target
fi

#--------------------------------------------------------------------------------

_pkgname=gcc
pkgname=$_target-$_pkgname
pkgver=5.1.0
_pkgver=5
_islver=0.14.1
pkgrel=4
_snapshot=5-20150519
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'mips64el')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://$_pkgname.gnu.org"
makedepends=('binutils>=2.25' 'libmpc' 'doxygen')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs')
source=(#ftp://$_pkgname.gnu.org/pub/$_pkgname/releases/$_pkgname-${pkgver}/$_pkgname-${pkgver}.tar.bz2
        ftp://$_pkgname.gnu.org/pub/$_pkgname/snapshots/${_snapshot}/$_pkgname-${_snapshot}.tar.bz2
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        pr65882.patch
        pr66035.patch
        $_pkgname-xtensa.patch::https://raw.githubusercontent.com/qca/open-ath9k-htc-firmware/1.3.2/local/patches/$_pkgname.patch
        mips-kfreebsd-gnu.patch)
md5sums=('84f261b2f23e154ec6d9bd4149851a21'
         '118d1a379abf7606a3334c98a8411c79'
         '9a9cc98e916fd37c7b3dad50f29d2f48'
         '5b980076cd5fcbc3aff6014f306282dd'
         '81372ee980289a9f6df01dad31c64a63'
         '43282cddb2080b1180f7b76d3a8a832c')

if [ -n "${_snapshot}" ]; then
  _basedir=$_pkgname-${_snapshot}
else
  _basedir=$_pkgname-${pkgver}
fi

_libdir="usr/lib/$_pkgname/$_target/$pkgver"

prepare() {
  cd ${srcdir}/${_basedir}

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' $_pkgname/Makefile.in

  # Parabola installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' $_pkgname/config/i386/t-linux64

  echo ${pkgver} > $_pkgname/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,$_pkgname}/configure

  # https://gcc.gnu.org/ml/gcc-patches/2015-04/msg01558.html
  patch -p1 -i ${srcdir}/pr65882.patch

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66035
  patch -p1 -i ${srcdir}/pr66035.patch

  # open-ath9k-htc-firmware patch on xtensa-unknown-elf
  [[ $_target == xtensa-unknown-elf ]] && patch -p1 -i ${srcdir}/$_pkgname-xtensa.patch

  # mips patch on kfreebsd-gnu
  [[ $_target == mips64el-unknown-kfreebsd-gnu ]] && \
    patch -p1 -i ${srcdir}/mips-kfreebsd-gnu.patch

  mkdir ${srcdir}/$_pkgname-build
}

build() {
  cd ${srcdir}/$_pkgname-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  ${srcdir}/${_basedir}/configure --prefix=/usr \
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
      --enable-checking=release \
      --with-default-libstdcxx-abi=c++98 --disable-nls \
      --target=$_target
  make all-$_pkgname
}

package() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends"
  depends=("$_target-binutils>=2.25" 'libmpc')
  groups=('cross-devel')
  options=('staticlibs')
  install=$_pkgname.install

  cd ${srcdir}/$_pkgname-build

  make -C $_pkgname DESTDIR=${pkgdir} install-driver install-cpp install-$_pkgname-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 $_pkgname/gcov $pkgdir/usr/bin/$_target-gcov
  install -m755 -t $pkgdir/${_libdir}/ $_pkgname/{cc1,cc1plus,collect2,lto1}

  make DESTDIR=${pkgdir} install-fixincludes
  make -C $_pkgname DESTDIR=${pkgdir} install-mkheaders
  make -C lto-plugin DESTDIR=${pkgdir} install

  make -C $_pkgname DESTDIR=${pkgdir} install-man

  make -C libcpp DESTDIR=${pkgdir} install
  make -C $_pkgname DESTDIR=${pkgdir} install-po

  # many packages expect this symlink
  ln -s $_target-$_pkgname ${pkgdir}/usr/bin/$_target-cc

  # POSIX conformance launcher scripts for c89 and c99
  cat > $pkgdir/usr/bin/$_target-c89 <<"EOF"
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
sed -i "s|exec gcc|exec $_target-gcc|" $pkgdir/usr/bin/$_target-c89

  cat > $pkgdir/usr/bin/$_target-c99 <<"EOF"
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
sed -i "s|exec gcc|exec $_target-gcc|" $pkgdir/usr/bin/$_target-c99

  chmod 755 $pkgdir/usr/bin/$_target-c{8,9}9

  # Remove man documents that conflict with host version
  rm -rf ${pkgdir}/usr/share/man/man7

  # Remove unused dirs
  rmdir ${pkgdir}/usr/{include,share/info}
}
