# Maintainer: Rafal Mielniczuk <rafal DOT mielniczuk2 AT gmail DOT com>
# Original PKGBUILD: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=bochs-svn
pkgver=2.6.11.r14201
pkgrel=1
pkgdesc="A portable x86 PC emulation software package, including GUI debugger (SVN Snapshot)"
arch=('x86_64')
url="http://bochs.sourceforge.net/"
license=('LGPL')
depends=('gcc-libs' 'libxrandr' 'libxpm' 'gtk2')
conflicts=('bochs')
source=("$pkgname::svn://svn.code.sf.net/p/bochs/code/trunk/bochs")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  local rel="$(grep -e "^VERSION=" configure | sed -e 's/.svn//' -e 's/VERSION=//' -e 's/\"//g')"
  printf "%s.r%s" "$rel" "${ver//[[:alpha:]]}"
}

build() {
    cd "$srcdir/$pkgname"

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
        --enable-long-phy-address \
        --enable-disasm \
        --enable-usb \
        --enable-debugger \
        --enable-sb16 \
        --enable-e1000
        #--with-sdl
        #--enable-x86-debugger
        #--enable-all-optimizations
        #--enable-plugins

    make -j 1
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 .bochsrc "$pkgdir/etc/bochsrc-sample.txt"
}
