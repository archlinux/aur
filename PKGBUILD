# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=dunedynasty-git
pkgver=1.5.7.r263.g6f925e9
pkgrel=1
pkgdesc="Enhanced continuation of the classic real-time strategy game Dune II (development version)"
url="http://dunedynasty.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('allegro' 'enet')
makedepends=('cmake')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
optdepends=('fluidsynth: software synthesizer for midi music'
            'soundfont-fluid: good soundfont for use with fluidsynth'
            'timidity++: alternative midi sequencer'
            'timidity-freepats: patch set for timidity++'
            'libmad: for mp3 music support')
install=dunedynasty.install
source=("git+http://git.code.sf.net/p/dunedynasty/dunedynasty"
        "${pkgname%-*}.desktop")
sha256sums=('SKIP'
            '4bc37a890a354e274b152a03fffa61d2da1609131c848742e1e4bca537176493')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd ${pkgname%-*}

  # set doc folder
  sed 's|doc/dunedynasty-${DUNE_DYNASTY_VERSION}|share/doc/dunedynasty|' -i CMakeLists.txt
  # set soundfont path
  sed 's|s/sf2/FluidR3_GM.sf2|fonts/FluidR3_GM2-2.sf2|' -i dist/dunedynasty.cfg-sample
}

build() {
  cd ${pkgname%-*}

  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DDUNE_DATA_DIR=/usr/share/dunedynasty
  make
}

package() {
  cd ${pkgname%-*}

  make DESTDIR="$pkgdir/" install

  # remove license, part of common licenses
  rm -f "$pkgdir"/usr/share/doc/${pkgname%-*}/COPYING

  # .desktop entry
  install -Dm644 src/video/dune2_32x32.xpm "$pkgdir"/usr/share/pixmaps/${pkgname%-*}.xpm
  install -Dm644 ../${pkgname%-*}.desktop "$pkgdir"/usr/share/applications/${pkgname%-*}.desktop
}
