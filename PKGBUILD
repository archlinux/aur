# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=lib32-sdl2_mixer-minimal-git
pkgver=2.0.4
pkgrel=1
pkgdesc='A simple multi-channel audio mixer'
arch=('x86_64')
url='https://www.libsdl.org/projects/SDL_mixer/'
license=('MIT')
depends=('lib32-glibc' 'lib32-sdl2' 'sdl2_mixer')
makedepends=('gcc-multilib' 'git')
optdepends=('lib32-fluidsynth: MIDI software synth, replaces built-in timidity'
            'lib32-libmodplug: tracker support'
            'lib32-mpg123: mp3 support'
            'lib32-libvorbis: vorbis support'
            'lib32-flac: flac support')
provides=(lib32-sdl2_mixer)
conflicts=(lib32-sdl2_mixer)
source=("git+https://github.com/libsdl-org/SDL_mixer")
sha256sums=('SKIP')

pkgver() {
  cd SDL_mixer
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd SDL_mixer

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./autogen.sh
  ./configure \
    --prefix='/usr' --libdir='/usr/lib32' --disable-static --disable-music-cmd --disable-music-wave --disable-music-mod --disable-music-mod-modplug --disable-music-mod-modplug-shared --disable-music-mod-mikmod --disable-music-mod-mikmod-shared --disable-music-midi --disable-music-midi-timidity --disable-music-midi-native --disable-music-midi-fluidsynth --disable-music-midi-fluidsynth-shared --disable-music-ogg --disable-music-ogg-tremor --disable-music-ogg-shared --disable-music-flac --disable-music-flac-shared --disable-music-mp3 --disable-music-mp3-mad-gpl --disable-music-mp3-mad-gpl-dithering --disable-music-mp3-mpg123 --disable-music-mp3-mpg123-shared --disable-music-opus --disable-music-opus-shared
  make
}

package() {
  cd SDL_mixer

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2_mixer "${pkgdir}"/usr/share/licenses/lib32-sdl2_mixer
}

# vim: ts=2 sw=2 et:
