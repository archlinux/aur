# Maintainer: Jacob Garby <j4cobgarby@gmail.com>
# Contributor: Peter Vanusanik <admin@en-circle.com>
# stolen from bochs PKGBUILD in normal repos, but modified

pkgname=bochs-gdb
pkgver=2.6.11
pkgrel=3
pkgdesc="A portable x86 PC emulation software package with gdbstub"
arch=('x86_64')
url="http://bochs.sourceforge.net/"
license=('LGPL')
depends=('gcc-libs' 'libxrandr' 'libxpm' 'gtk2' 'bochs')
source=("http://downloads.sourceforge.net/sourceforge/bochs/bochs-$pkgver.tar.gz")
md5sums=('61dbf6d5c0384712e1f3e51e88381b4c')

prepare() {
    cd "$srcdir/bochs-$pkgver"
    # 4.X kernel is basically 3.20
    sed -i 's/2\.6\*|3\.\*)/2.6*|3.*|4.*)/' configure*
}

build() {
    cd "$srcdir/bochs-$pkgver"

    ./configure \
        --prefix=/usr \
        --without-wx \
        --with-x11 \
        --with-x \
        --with-term \
        --disable-docbook \
        --enable-cpu-level=6 \
        --enable-fpu \
        --enable-3dnow \
	--enable-evex \
        --enable-disasm \
        --enable-x86-64 \
        --enable-avx \
        --enable-long-phy-address \
        --enable-disasm \
        --enable-pcidev \
        --enable-usb \
        --enable-gdb-stub 
        
    sed -i 's/^LIBS = /LIBS = -lpthread/g' Makefile
    make -j 1
}

package() {
    cd "$srcdir/bochs-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 .bochsrc "$pkgdir/etc/bochsrc-sample.txt"
    
    cd "$pkgdir/usr/bin/"
    mv bochs bochs-gdb-a20
    rm bximage
    cd "$pkgdir/usr/"
    rm -rfv share
    cd "$pkgdir"
    rm -rfv etc
}
