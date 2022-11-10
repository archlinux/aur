# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: qwak <qwak@w8.pl>
# Contributor: ThatGuyJon <theonereddragon@gmail.com>

pkgname=lib32-sdl_mixer
pkgver=1.2.12
pkgrel=5
pkgdesc='A simple multi-channel audio mixer'
arch=(x86_64)
url=https://www.libsdl.org/projects/SDL_mixer/
license=(custom)
depends=(
  lib32-libmikmod
  lib32-libvorbis
  lib32-sdl
  sdl_mixer
)
makedepends=(lib32-fluidsynth)
optdepends=('lib32-fluidsynth: MIDI software synth, replaces built-in timidity')
source=(
  https://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${pkgver}.tar.gz
  sdl_mixer-mikmod1.patch
  sdl_mixer-mikmod2.patch
  sdl_mixer-fluidsynth-volume.patch
  sdl_mixer-double-free-crash.patch
)
b2sums=('b2fa822204fdaad860ff30307120bff7badbcc042d0b891563973794f715099aa961983e0dbf7e3d936179cbc615517c268f01f4619fcdcd48f18ff66dc49bd1'
        'dde98e1896dba35d3e40c9966d064769122f8411de9a189efd8e51959000d950961bc5e23c059a797c22278fa6e133fb5eb1c36cc204b869c93750e8b50782b0'
        '0736586531710a6524398128539761d01c20cf150c7e9ed81413d7d6030300a8c1c96d36d4239b588091edcae709e824250808a85bb98916c3b454aea35662c6'
        'f34ecba744d1c110d9feb05ae1cd5774b8a749ec1c77cc470a03ba3ed6766cecb2b5f09e28a246a724594ae3277f862c3531ab0dd857e5e90c0769a8e93847cb'
        '068e223b84a162731ea9a306c883d311524db850665aaf17f844619dc81d5c69ac5845b8305c06753f16457e649c63cbf1b997b6111a3263b023f478fd77f83f')

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
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
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
