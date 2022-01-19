# Maintainer: Sebastian <sebastianmontoya209@protonmail.com>

_target=x86_64-elf
_sysroot=/usr/lib/${_target}
_pkgname=binutils

pkgname=$_target-${_pkgname}
pkgver=2.37
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the x86_64-elf target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
options=(!emptydirs !docs)
source=("https://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz"
        "https://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz.sig")

sha256sums=('820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c'
            'SKIP')
_basedir=binutils-$pkgver
validpgpkeys=("3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F")
prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

    mkdir $srcdir/binutils-build
}

build() {
    cd binutils-build

    $srcdir/$_basedir/configure \
        --target=$_target \
        --prefix=${_sysroot} \
        --bindir=/usr/bin \
        --libdir=/usr/lib/x86_64-elf/ \
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
