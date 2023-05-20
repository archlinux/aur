# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lame-altivec
pkgver=3.100
pkgrel=5
pkgdesc="AltiVec/SSE optimized LAME encoder"
arch=('i686' 'x86_64')
url="https://tmkk.undo.jp/lame/index_e.html"
license=('LGPL')
depends=('glibc' 'ncurses')
makedepends=('nasm')
provides=("lame=$pkgver")
conflicts=('lame')
options=('staticlibs')
source=("https://downloads.sourceforge.net/project/lame/lame/$pkgver/lame-$pkgver.tar.gz"
        "https://tmkk.undo.jp/lame/lame-3.100-sse-20171014.diff"
        "lame.pc.in::https://gitlab.archlinux.org/archlinux/packaging/packages/lame/-/raw/main/lame.pc.in")
sha256sums=('ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e'
            '8c32c706f7fce0da8150a5fa0a4e7efadc77cc39e0375c05dc2737331a584662'
            'SKIP')


prepare() {
  cd "lame-$pkgver"

  sed -e "s/VERSION/$pkgver/" "$srcdir/lame.pc.in" > "$srcdir/lame.pc"
  patch -Np0 -i "$srcdir/lame-3.100-sse-20171014.diff"
}

build() {
  cd "lame-$pkgver"

  ./configure \
    --prefix="/usr" \
    --enable-mp3rtp \
    --enable-nasm
  make
}

check() {
  cd "lame-$pkgver"

  #make test
}

package() {
  cd "lame-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/lame.pc" -t "$pkgdir/usr/lib/pkgconfig"
}
