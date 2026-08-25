# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=bochs
pkgver=3.1
pkgrel=2
pkgdesc="A portable x86 PC emulation software package, including GUI debugger"
arch=('x86_64' 'pentium4' 'i686' 'i486')
url="http://bochs.sourceforge.net/"
license=('LGPL')
depends=('gcc-libs' 'libxrandr' 'libxpm' 'gtk2')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('14aaf78dbe1337987923fffc4e7a962ae56abcf9a87474ace39e593f9f84ee84')

prepare() {
    # upstream's 3.1 release tarball extracts to a bare "bochs/" dir
    # instead of "bochs-$pkgver/" like every prior release; normalize it
    # so the rest of this PKGBUILD doesn't need to care either way.
    if [ ! -d "$srcdir/$pkgname-$pkgver" ] && [ -d "$srcdir/$pkgname" ]; then
        mv "$srcdir/$pkgname" "$srcdir/$pkgname-$pkgver"
    fi

    cd "$srcdir/$pkgname-$pkgver"
    # 4.X kernel is basically 3.20
    sed -i 's/2\.6\*|3\.\*)/2.6*|3.*|4.*)/' configure*
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

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
        --enable-debugger
        #--with-sdl
        #--enable-x86-debugger
        #--enable-all-optimizations
        #--enable-plugins
    sed -i 's/^LIBS = /LIBS = -lpthread/g' Makefile
    make -j 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
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
