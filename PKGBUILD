# Maintainer: Ernestas Kulik <ernestas DOT kulik AT gmail DOT com>

_target=aarch64-none-elf

pkgname=${_target}-binutils
pkgver=2.28
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files.'
url='https://www.gnu.org/software/binutils/'
license=('GPL3')
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2"
        "https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2.sig")
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93') # Tristan Gingold <gingold@adacore.com>
sha1sums=('f8b033731f6baa437d429c60e2623570f1ef9d6b'
          'SKIP')
arch=('x86_64')
depends=('glibc' 'zlib')
options=('!buildflags')

build() {
    cd binutils-$pkgver

    ./configure \
        --disable-nls \
        --disable-werror \
        --enable-deterministic-archives \
        --enable-gold \
        --enable-ld=default \
        --enable-plugins \
        --prefix=/usr \
        --target=$_target \
        --with-gnu-as \
        --with-gnu-ld \
        --with-sysroot=/usr/$_target

    make
}

check() {
    cd binutils-$pkgver

    make check
}

package() {
    cd binutils-$pkgver

    make DESTDIR="$pkgdir" install

    rm "$pkgdir"/usr/share/man/man1/${_target}-{dlltool,nlmconv,windmc,windres}.1
    rm -r "$pkgdir"/usr/share/info
}
