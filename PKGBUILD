# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=dunedynasty
pkgver=1.5.7
pkgrel=1
pkgdesc="Enhanced continuation of the classic real-time strategy game Dune II"
url="http://dunedynasty.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('allegro')
makedepends=('cmake')
optdepends=('fluidsynth: software synthesizer for midi music'
            'fluidr3: good soundfont for use with fluidsynth'
            'timidity++: alternative midi sequencer'
            'timidity-freepats: patch set for timidity++'
            'libmad: for mp3 music support')
install=$pkgname.install
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        $pkgname.desktop)
md5sums=('8ee5bddfb3a613657006edb70f57bb52'
         'SKIP')
sha256sums=('a50e5a643db6835acb8cf7afd262b5eeba3fac01151ea51afcb1f5914d35a5c5'
            'SKIP')

prepare() {
  cd $pkgname-$pkgver

  # set doc folder
  sed -i 's|doc/dunedynasty-${DUNE_DYNASTY_VERSION}|share/doc/dunedynasty|' \
    CMakeLists.txt
  # set soundfont path
  sed -i 's|s/sf2/FluidR3_GM.sf2|fonts/fluidr3/FluidR3GM.SF2|' \
    dist/dunedynasty.cfg-sample
}

build() {
  cd $pkgname-$pkgver

  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DDUNE_DATA_DIR=/usr/share/$pkgname
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install

  # remove license, part of common licenses
  rm -f "$pkgdir"/usr/share/doc/$pkgname/COPYING

  # desktop entry
  install -Dm644 src/video/dune2_32x32.xpm "$pkgdir"/usr/share/pixmaps/$pkgname.xpm
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
