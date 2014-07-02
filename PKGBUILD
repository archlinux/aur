# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=lib32-sdl2_mixer
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple multi-channel audio mixer (Version 2, 32 bit)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_mixer"
license=('MIT')
depends=("${pkgname#*-}=$pkgver" 'lib32-sdl2' 'lib32-libvorbis' 'lib32-libmodplug'
         'lib32-smpeg2' 'lib32-flac')
makedepends=('lib32-fluidsynth' 'gcc-multilib')
optdepends=('lib32-fluidsynth: MIDI software synth, replaces built-in timidity')
conflicts=('lib32-sdl2-mixer') # to replace broken package with wrong name
source=("$url/release/SDL2_mixer-$pkgver.tar.gz")
sha256sums=('a8ce0e161793791adeff258ca6214267fdd41b3c073d2581cd5265c8646f725b')

prepare() {
  cd SDL2_mixer-$pkgver

  # patch to use timidity++
  sed -e "s|/etc/timidity|/etc/timidity++|g" \
    -e "s|/etc/timidity++.cfg|/etc/timidity++/timidity.cfg|g" -i timidity/config.h
}

build() {
  cd SDL2_mixer-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --disable-static --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  make -C SDL2_mixer-$pkgver DESTDIR="$pkgdir/" install

  # remove header file
  rm -rf "$pkgdir"/usr/include

  # link license
  install -d "$pkgdir"/usr/share/licenses
  ln -s ${pkgname#*-} "$pkgdir"/usr/share/licenses/$pkgname
}
