# Maintainer: Huayu ZHANG <zhanghuayu1233@gmail.com>

_target=i686-elf
_sysroot=/usr/lib/${_target}
_pkgname=binutils

pkgname=$_target-${_pkgname}-git
pkgver=dev
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the i686-elf target (including GDB) (development build)'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
options=(!emptydirs !docs)
replaces=("i686-elf-binutils")
#conflicts=("i686-elf-binutils")
source=("git+https://sourceware.org/git/binutils-gdb.git")

sha256sums=('SKIP')

_basedir=binutils-gdb

#prepare() {
    #cd ${srcdir}/${_pkgname}-gdb

    # sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

    #mkdir $srcdir/binutils-build
#}

build() {
    cd binutils-gdb

    ./configure \
        --target=$_target \
        --prefix=${_sysroot} \
        --bindir=/usr/bin \
        --libdir=/usr/lib/i686-elf/ \
        --with-sysroot=${_sysroot} \
        --disable-nls \
	#--disable-gdb \
	#--disable-gdbserver \
	#--disable-gdbsupport \
        --disable-werror

    make -j$(nproc)
}

#check() {
    #cd binutils-gdb

    # do not abort on errors - manually check log files
    # make -k check
#}

package() {
    cd binutils-gdb

    make DESTDIR="$pkgdir" install

    # Remove info and make since it expected already present by host compiler
    rm -r ${pkgdir}/${_sysroot}/share/{info,man}
}
