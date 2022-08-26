# Maintainer: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor: Sebastian <sebastianmontoya209@protonmail.com>
# Contributor: Finlay Maroney <finman292004@protonmail.com>
# Contributor: thatmadhacker <finman292004@gmail.com>
# Contributor: Marc Boocha <marcboocha@gmail.com>

_target=x86_64-elf
_sysroot=/usr/lib/${_target}
_pkgname=binutils

pkgname=$_target-${_pkgname}
pkgver=2.39
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the x86_64-elf target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
options=(!emptydirs !docs)
source=("https://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz"
        "https://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz.sig")

sha256sums=('645c25f563b8adc0a81dbd6a41cffbf4d37083a382e02d5d3df4f65c09516d00'
            'SKIP')
_basedir=binutils-$pkgver
validpgpkeys=("3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F")
prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}

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
