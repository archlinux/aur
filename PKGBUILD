# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: qwak <qwak@w8.pl>
# Contributor: ThatGuyJon <theonereddragon@gmail.com>

pkgname=lib32-sdl_mixer
pkgver=1.2.12
pkgrel=4
pkgdesc='A simple multi-channel audio mixer'
arch=('x86_64')
url='https://www.libsdl.org/projects/SDL_mixer/'
license=('custom')
depends=('lib32-libmikmod' 'lib32-libvorbis' 'lib32-sdl' 'lib32-smpeg' 'sdl_mixer')
makedepends=('gcc-multilib' 'lib32-fluidsynth')
optdepends=('lib32-fluidsynth: MIDI software synth, replaces built-in timidity')
source=("https://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${pkgver}.tar.gz"
        'sdl_mixer-mikmod1.patch'
        'sdl_mixer-mikmod2.patch'
        'sdl_mixer-fluidsynth-volume.patch'
        'sdl_mixer-double-free-crash.patch')
sha256sums=('1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a'
            'e0d36cd81083a0b033436b8f300cc4f4513a6043e57fea139afbade02dbe0de8'
            'a0c5326b4363464159a38dc51badad984b65ce0fa4c3b1dd1ad5f73bc7b6c55e'
            '4b6c567debf18c88398d4045a6e4ed0954f0e04cc61162ca907a83ddec17cd70'
            'b707f5c8d1229d1612cc8a9f4e976f0a3b19ea40d7bd1d5bc1cbd5c9f8bca56d')

prepare() {
  cd SDL_mixer-${pkgver}

  patch -Np1 -i ../sdl_mixer-mikmod1.patch
  patch -Np1 -i ../sdl_mixer-mikmod2.patch
  patch -Np1 -i ../sdl_mixer-fluidsynth-volume.patch
  patch -Np1 -i ../sdl_mixer-double-free-crash.patch

  sed -e '/CONFIG_FILE_ETC/s|/etc/timidity.cfg|/etc/timidity++/timidity.cfg|;
          /DEFAULT_PATH/s|/etc/timidity|/etc/timidity++|;
          /DEFAULT_PATH2/s|/usr/local/lib/timidity|/usr/lib/timidity|' \
      -i timidity/config.h
}

build() {
  cd SDL_mixer-${pkgver}

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd SDL_mixer-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl_mixer "${pkgdir}"/usr/share/licenses/lib32-sdl_mixer
}

# vim: ts=2 sw=2 et:
