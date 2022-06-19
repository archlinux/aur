# Maintainer: Huayu ZHANG <zhanghuayu1233@gmail.com>

_target=i686-elf
_sysroot=/usr/lib/${_target}
_pkgname=binutils

pkgname=$_target-${_pkgname}-git
pkgver=1
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the x86_64-elf target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
options=(!emptydirs !docs)
source=("git://sourceware.org/git/binutils-gdb.git")

sha256sums=('SKIP')

_basedir=binutils

prepare() {
    cd ${srcdir}/${_pkgname}

    sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

    mkdir $srcdir/binutils-build
}

build() {
    cd binutils-build

    $srcdir/$_basedir/configure \
        --target=$_target \
        --prefix=${_sysroot} \
        --bindir=/usr/bin \
        --libdir=/usr/lib/i686-elf/ \
        --with-sysroot=${_sysroot} \
        --disable-nls \
        --disable-werror

    make
}

check() {
    cd binutils-build

    # do not abort on errors - manually check log files
    make -k check
}

package() {
    cd binutils-build

    make DESTDIR="$pkgdir" install

    # Remove info and make since it expected already present by host compiler
    rm -r ${pkgdir}/${_sysroot}/share/{info,man}
}
