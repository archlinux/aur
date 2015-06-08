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

# build from head of release branch as bug fix releases are rare

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

_pkgname=binutils
pkgname=$_target-$_pkgname
pkgver=2.25
pkgrel=5
_commit=69352378
pkgdesc="A set of programs to assemble and manipulate binary and object files"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'mips64el')
url="http://www.gnu.org/software/$_pkgname/"
license=('GPL')
groups=('cross-devel')
depends=('glibc>=2.20' 'zlib')
makedepends=('git')
checkdepends=('dejagnu' 'bc')
options=('staticlibs' '!distcc' '!ccache')
install=$_pkgname.install
#source=(ftp://ftp.gnu.org/gnu/$_pkgname/$_pkgname-${pkgver}.tar.bz2{,.sig})
source=(git://sourceware.org/git/$_pkgname-gdb.git#commit=${_commit}
        $_pkgname-e9c1bdad.patch
        $_pkgname-xtensa.patch::https://raw.githubusercontent.com/qca/open-ath9k-htc-firmware/1.3.2/local/patches/$_pkgname.patch)
md5sums=('SKIP'
         'eb3aceaab8ed26e06d505f82beb30f8f'
         '7077126d96e9a755a0eaddb5505efe68')
#validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93')

prepare() {
  #cd ${srcdir}/$_pkgname-${pkgver}
  cd ${srcdir}/$_pkgname-gdb

  # https://sourceware.org/bugzilla/show_bug.cgi?id=16992
  patch -p1 -i ${srcdir}/$_pkgname-e9c1bdad.patch

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  # open-ath9k-htc-firmware patch on xtensa-unknown-elf
  [[ $_target == xtensa-unknown-elf ]] && patch -p1 -i ${srcdir}/$_pkgname-xtensa.patch

  mkdir ${srcdir}/$_pkgname-build
}

build() {
  cd ${srcdir}/$_pkgname-build

  #${srcdir}/$_pkgname-${pkgver}/configure --prefix=/usr \
  ${srcdir}/$_pkgname-gdb/configure --prefix=/usr \
    --with-lib-path=/usr/lib:/usr/local/lib \
    --with-bugurl=https://labs.parabola.nu/ \
    --enable-threads --with-pic \
    --enable-ld=default --enable-gold --enable-plugins \
    --disable-werror --disable-gdb --disable-nls \
    --target=$_target --with-sysroot=/usr/$_target

  # check the host environment and makes sure all the necessary tools are available
  make configure-host

  make tooldir=/usr
}

check() {
  cd ${srcdir}/$_pkgname-build
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd ${srcdir}/$_pkgname-build
  make prefix=${pkgdir}/usr install

  # Remove info documents that conflict with host version
  rm -rf ${pkgdir}/usr/share/info
}
