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
pkgver=3.7.2~rc5
_pkgver=3_7_2_RC5 # Upstream's url/dirs ...
pkgrel=1
epoch=1
pkgdesc="An enhancement of the FreeSpace 2 engine"
url="http://scp.indiegames.us"
arch=('i686' 'x86_64')
license=('custom:fs2_open')
depends=('fs2_open-data' 'glu' 'libjpeg' 'libpng' 'libtheora'
         'libvorbis' 'lua51' 'jansson' 'openal' 'sdl')
optdepends=('fs2_open-mediavps: extensive audiovisual enhancements')
install=$pkgname.install
source=(http://swc.fs2downloads.com/builds/fs2_open_${_pkgver}_src.tgz
        'fs2_open'
        'fs2_open.desktop'
        'increase_joy_buttons_fixed.patch'
        'options')
sha256sums=('a68ed22e2868e987c7ab5167207a9da3ab192c0efa32c49f6f5ab364609d6090'
            '6b79b1989692cd0e03106403d2c96a70d3ef6f75f488142ece6a4db9acd260c9'
            'cac8914fb96eb4f09d8dec0005ccb3626499ab9f3f4c5f64c11bd8d2e913e372'
            'b5d6574fbb6cb84294502140c74310178f6d588092ffe33692274d95a882096b'
            '6e8148aea5d23658e74a2893652de8889af45d542c079d086b8fd586c8b73229')

prepare() {
  cd "$srcdir/${pkgname}_${_pkgver}"

  # Increases hard limit of joystick buttons for better use with HOTAS etc.
  patch -p1 -i "$srcdir/increase_joy_buttons_fixed.patch"
}

build() {
  cd "$srcdir/${pkgname}_${_pkgver}"

  # Add --enable-debug to make a debug build.  These are NOT meant for
  # general play; only make a debug build if generating logs/bug-reports.
  env LDFLAGS="-l:liblua.so.5.1 $LDFLAGS" \
      CXXFLAGS="-I/usr/include/lua5.1 $CXXFLAGS" \
      ./autogen.sh --enable-speech
  make
}

package() {
  cd "$srcdir/${pkgname}_${_pkgver}"

  _pkgver=${pkgver//~rc/_RC}
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 ../fs2_open.desktop "$pkgdir/usr/share/applications/fs2_open.desktop"
  install -D -m644 ../options "$pkgdir/usr/share/$pkgname/options"
  install -D -m755 code/fs2_open_$_pkgver "$pkgdir/opt/$pkgname/fs2_open_$_pkgver"
  install -D -m755 "$srcdir/fs2_open" "$pkgdir/usr/bin/fs2_open"
}
