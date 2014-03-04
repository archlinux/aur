# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=dunedynasty
pkgname=$_pkgbase-git
pkgver=1.5.7.r186.g9bf26be
pkgrel=1
pkgdesc="Enhanced continuation of the classic real-time strategy game Dune II (development version)"
url="http://dunedynasty.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('allegro' 'enet')
makedepends=('cmake')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
optdepends=('fluidsynth: software synthesizer for midi music'
            'soundfont-fluid: good soundfont for use with fluidsynth'
            'timidity++: alternative midi sequencer'
            'timidity-freepats: patch set for timidity++'
            'libmad: for mp3 music support')
install=$_pkgbase.install
source=($_pkgbase::"git+http://git.code.sf.net/p/dunedynasty/dunedynasty"
        "$_pkgbase.desktop")
sha256sums=('SKIP'
            '4bc37a890a354e274b152a03fffa61d2da1609131c848742e1e4bca537176493')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgbase

  # set doc folder
  sed -i 's|doc/dunedynasty-${DUNE_DYNASTY_VERSION}|share/doc/dunedynasty|' \
    CMakeLists.txt
  # set soundfont path
  sed -i 's|s/sf2/FluidR3_GM.sf2|fonts/FluidR3_GM2-2.sf2|' \
    dist/dunedynasty.cfg-sample
}

build() {
  cd $_pkgbase

  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DDUNE_DATA_DIR=/usr/share/$_pkgbase
  make
}

package() {
  cd $_pkgbase

  make DESTDIR="$pkgdir/" install

  # remove license, part of common licenses
  rm -f "$pkgdir"/usr/share/doc/$_pkgbase/COPYING

  # desktop entry
  install -Dm644 src/video/dune2_32x32.xpm "$pkgdir"/usr/share/pixmaps/$_pkgbase.xpm
  install -Dm644 ../$_pkgbase.desktop "$pkgdir"/usr/share/applications/$_pkgbase.desktop
}
