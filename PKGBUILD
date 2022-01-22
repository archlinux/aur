# Maintainer: Benjamin Sherman <benjamin AT bensherman DOT io>
# Modified from PKGBUILD in official repositories

pkgname=bochs-sdl
pkgver=2.7
pkgrel=1
pkgdesc="A portable x86 PC emulation software package, including GUI debugger, with sdl support"
arch=('x86_64')
url="http://bochs.sourceforge.net/"
license=('LGPL')
depends=('gcc-libs' 'libxrandr' 'libxpm' 'gtk2')
conflicts=('bochs')
provides=('bochs')
source=("https://downloads.sourceforge.net/sourceforge/bochs/bochs-$pkgver.tar.gz")
md5sums=('d77a43c21cfd8aa013eb2eaa35644f80')

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
        --enable-smp \
        --enable-x86-64 \
        --enable-avx \
        --enable-evex \
        --enable-long-phy-address \
        --enable-disasm \
        --enable-pcidev \
        --enable-usb \
        --enable-debugger \
        --with-sdl
    sed -i 's/^LIBS = /LIBS = -lpthread/g' Makefile
    make -j 1
}

package() {
    cd "$srcdir/bochs-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 .bochsrc "$pkgdir/etc/bochsrc-sample.txt"
}

