# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player-git
_pkgname=${pkgname%-*}
pkgver=0.7.0.r460.g9ee72af7
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter (development version)"
arch=('i686' 'x86_64')
url="https://easyrpg.org"
license=('GPL3')
conflicts=("$_pkgname")
provides=("$_pkgname=${pkgver%.r*}")
makedepends=('git' 'cmake' 'ninja' 'asciidoctor')
depends=('liblcf-git' 'sdl2' 'libpng' 'pixman' 'fmt' 'freetype2' 'harfbuzz'
         'mpg123' 'libsndfile' 'libvorbis' 'opusfile' 'speexdsp'
         'hicolor-icon-theme')
optdepends=('alsa-lib: native MIDI playback (needs sequencer)'
            'wildmidi: decoder for MIDI (needs "GUS patches")'
            'fluidsynth: better MIDI decoder (needs soundfont)'
            'libxmp: decoder for tracker music, used by few games'
            'rpg2000-rtp: run time package for some 2k games'
            'rpg2003-rtp: run time package for some 2k3 games'
            'wine: for installing run time packages (RTP) manually')
install=$_pkgname.install
source=($_pkgname::"git+https://github.com/EasyRPG/Player.git")
md5sums=('SKIP')

pkgver() {
  git -C $_pkgname describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
  rm -rf aurbuild
}

build() {
  cmake -S $_pkgname -B aurbuild -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLAYER_ENABLE_DRWAV=OFF
  cmake --build aurbuild
}

check() {
  cmake --build aurbuild --target check
}

package() {
  DESTDIR="$pkgdir" cmake --install aurbuild
}
