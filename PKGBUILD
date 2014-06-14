# Maintainer: Jacob Emmert-Aronson <jacob at mlaronson dot com>
# Contributor: Rene Schoebel <schoebel.r at gmail dot com>
# Contributor: ZekeSulastin <zekesulastin@gmail.com>
# Contributor: Mr_Robotic_Evil <mr.robotic.evil@googlemail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

# This PKGBUILD only generates the engine binary.
# The retail Freespace 2 data is required to play the
# original game and most mods.  You can use a non-AUR/pacman'd
# copy, but you'll be on your own as far as running the game
# and mods are concerned.
# Check the AUR package 'fs2_open-data' for details.

pkgname=fs2_open
pkgver=3.7.2~rc3
_pkgver=3_7_2_RC3 # Upstream's url/dirs ...
pkgrel=3
epoch=1
pkgdesc="An enhancement of the FreeSpace 2 engine"
url="http://scp.indiegames.us"
arch=('i686' 'x86_64')
license=('custom:fs2_open')
depends=('fs2_open-data' 'glu' 'libjpeg' 'libpng' 'libtheora'
         'libvorbis' 'lua51' 'jansson' 'openal' 'sdl')
optdepends=('fs2_open-mediavps: extensive audiovisual enhancements')
conflicts=('fs2_open_3614')
replaces=('fs2_open_3614')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://swc.fs2downloads.com/builds/fs2_open_${_pkgver}_src.tgz
        'fs2_open'
        'fs2_open.changelog'
        'fs2_open.desktop'
        'increase_joy_buttons_fixed.patch'
        'options'
        'osapi_unix.patch')
sha256sums=('999de332f90608a4d54d6c6b771a39cc680427da6cbbe8f41014bef763cb60e3'
            '0d6617923eb3ed485970d1ee15c3cfde9774826383e7ce3d5f666a09a8185adf'
            '6e85bffb776b7daf707d45741a5da5311f211885bfdb8ea44202691256b1d1b4'
            'cac8914fb96eb4f09d8dec0005ccb3626499ab9f3f4c5f64c11bd8d2e913e372'
            '750d9e51054e4c88679a9690a10d06a7fceaa29b7afa2f31cfcd022d6aa74041'
            '6e8148aea5d23658e74a2893652de8889af45d542c079d086b8fd586c8b73229'
            '4256b298690e1ef0fc4d923dd24b803fe57646a941eb48a6ffd7f8de0e96d945')

build()
{
  cd "$srcdir/${pkgname}_${_pkgver}"

  # Changes default video settings for better mod compatability
  patch -Np0 -i "$srcdir/osapi_unix.patch"

  # Increases hard limit of joystick buttons for better use with HOTAS etc.
  patch -Np0 -i "$srcdir/increase_joy_buttons_fixed.patch"

  # Add --enable-debug to make a debug build.  These are NOT meant for general play;
  #  only make a debug build if generating logs/bugreports.
  LDFLAGS="-l:liblua.so.5.1 $LDFLAGS" CXXFLAGS="-I/usr/include/lua5.1 $CXXFLAGS" ./autogen.sh --enable-speech
  make
}

package()
{
  cd "$srcdir/${pkgname}_${_pkgver}"

  _pkgver=${pkgver//~rc/_RC}
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 ../fs2_open.desktop "$pkgdir/usr/share/applications/fs2_open.desktop"
  install -D -m644 ../options "$pkgdir/usr/share/$pkgname/options"
  install -D -m755 code/fs2_open_$_pkgver "$pkgdir/opt/$pkgname/fs2_open_$_pkgver"
  install -D -m755 "$srcdir/fs2_open" "$pkgdir/usr/bin/fs2_open"
}
