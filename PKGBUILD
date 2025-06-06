# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-player
pkgver=0.8.1.1
pkgrel=1
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter"
arch=('x86_64')
url="https://easyrpg.org"
license=('GPL-3.0-or-later')
makedepends=('cmake' 'ninja' 'nlohmann-json')
depends=("liblcf>=${pkgver:0:5}" 'sdl2' 'libpng' 'pixman' 'fmt' 'freetype2' 'harfbuzz'
         'mpg123' 'libsndfile' 'libvorbis' 'opusfile' 'speexdsp' 'lhasa'
         'hicolor-icon-theme')
optdepends=('alsa-lib: native MIDI playback (needs sequencer)'
            'wildmidi: decoder for MIDI (needs "GUS patches")'
            'fluidsynth: better MIDI decoder (needs soundfont)'
            'libxmp: decoder for tracker music, used by few games'
            'rpg2000-rtp: run time package for some 2k games'
            'rpg2003-rtp: run time package for some 2k3 games'
            'wine: for installing run time packages (RTP) manually')
install=$pkgname.install
source=("https://easyrpg.org/downloads/player/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('52ab46efdc5253a5ef08d3eee49c84d5c5cbb770929f28a08681fe01e5279bb2')

prepare() {
  rm -rf aurbuild
}

build() {
  cmake -S $pkgname-$pkgver -B aurbuild -G Ninja \
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
