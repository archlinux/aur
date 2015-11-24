# Maintainer: Peter Vanusanik <admin@en-circle.com>
# stolen from bochs PKGBUILD in normal repos, but modified

pkgname=bochs-gdb
pkgver=2.6.8
pkgrel=2
pkgdesc="A portable x86 PC emulation software package with gdbstub"
arch=('i686' 'x86_64')
url="http://bochs.sourceforge.net/"
license=('LGPL')
depends=('gcc-libs' 'libxrandr' 'libxpm' 'gtk2' 'bochs')
source=("http://downloads.sourceforge.net/sourceforge/bochs/bochs-$pkgver.tar.gz")
md5sums=('8a243e2b5f7562f32d2b26f3cebbba08')

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
