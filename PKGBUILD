# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Shinonome Yuugata <shinonomeyuugata@gmail.com>

pkgname=bochs-sdl2
_pkgname=bochs
pkgver=2.8
pkgrel=2
pkgdesc="A portable x86 PC emulation software package, including GUI debugger, with SDL2 support"
arch=('x86_64' 'pentium4' 'i686' 'i486')
url="http://bochs.sourceforge.net/"
license=('LGPL-2.1-or-later')
depends=('gcc-libs' 'libxrandr' 'libxpm' 'gtk2' 'sdl2')
provides=('bochs')
conflicts=('bochs')
source=("https://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a85b13aff7d8411f7a9f356ba6c33b5f5dc1fbb107eb5018cc23a62639da0059')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    # 4.X kernel is basically 3.20
    sed -i 's/2\.6\*|3\.\*)/2.6*|3.*|4.*)/' configure*
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"

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
        --enable-smp \
        --enable-x86-64 \
        --enable-avx \
	    --enable-evex \
        --enable-long-phy-address \
        --enable-pcidev \
        --enable-usb \
        --enable-debugger \
        --with-sdl2
        #--enable-x86-debugger
        #--enable-all-optimizations
        #--enable-plugins
    sed -i 's/^LIBS = /LIBS = -lpthread/g' Makefile
    make -j 1
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 .bochsrc "$pkgdir/etc/bochsrc-sample.txt"
}

# disable host PCI device mapping, not supported for newer kernels in Bochs itself
if [ "${CARCH}" = "i486" -o  "${CARCH}" = "i686" -o "${CARCH}" = "pentium4" ]; then
  eval "$(
    declare -f build | \
      sed '
        s@--enable-pcidev@--disable-pcidev@g
      '
  )"
fi
