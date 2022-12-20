# Maintainer: Huayu ZHANG <zhanghuayu1233@gmail.com>

pkgname=bochs-gdb-stub
pkgver=2.7
pkgrel=1
pkgdesc="A portable x86 PC emulation software package with gdbstub"
arch=('x86_64' 'aarch64')
url="http://bochs.sourceforge.net/"
license=('LGPL')
depends=('gcc-libs' 'libxrandr' 'libxpm' 'gtk2')
replaces=("bochs-gdb")
conflicts=("bochs-gdb")
source=("http://downloads.sourceforge.net/sourceforge/bochs/bochs-$pkgver.tar.gz")
sha256sums=('a010ab1bfdc72ac5a08d2e2412cd471c0febd66af1d9349bc0d796879de5b17a')

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
        --enable-long-phy-address \
        --enable-disasm \
        --enable-pcidev \
        --enable-usb \
        --enable-gdb-stub 
    sed -i 's/^LIBS = /LIBS = -lpthread/g' Makefile
    make -j $(nproc)
}

package() {
    cd "$srcdir/bochs-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 .bochsrc "$pkgdir/etc/bochsrc-sample.txt"

    cd "$pkgdir/usr/bin/"
    mv bochs bochs-gdb
    if ($(uname -m) == x86_64);then \
        rm bximage \
        cd "$pkgdir/usr/" \
        rm -rfv share \
        cd "$pkgdir" \
        rm -rfv etc; \
    fi
}

