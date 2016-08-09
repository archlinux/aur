# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Jacob Emmert-Aronson <jacob at mlaronson dot com>
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
pkgver=3.7.4
_pkgver=3_7_4 # Upstream's url/dirs
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
sha256sums=('092b88ecf2ec13506a18e84be1d48cc03f65abba4b2cb5329450e9cae7cdbb25'
            'b2032f44400f172fad769a94b9a3b5af16d46ac3901f855b7a5693870876ad24'
            'cac8914fb96eb4f09d8dec0005ccb3626499ab9f3f4c5f64c11bd8d2e913e372'
            '44b46f3aa70c515d6ea28f85703479cb53238c2dca8c005d9eca56c301d78efd'
            'c593dacd19705f1aaf23170d7b65b4621945200d3a496e256f77e3f1f0279741')

prepare() {
  cd "${pkgname}_${_pkgver}"

  # Increases hard limit of joystick buttons for better use with HOTAS etc.
  patch -p1 -i "$srcdir/increase_joy_buttons_fixed.patch"
}

build() {
  cd "${pkgname}_${_pkgver}"

  # Add --enable-debug to make a debug build.  These are NOT meant for
  # general play; only make a debug build if generating logs/bug-reports.
  env LUA_CFLAGS="$(pkg-config --cflags lua51)" \
      LUA_LIBS="$(pkg-config --libs lua51)"     \
      ./autogen.sh --enable-speech
  make
}

package() {
  cd "${pkgname}_${_pkgver}"

  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 ../fs2_open.desktop "$pkgdir/usr/share/applications/fs2_open.desktop"
  install -D -m644 ../options "$pkgdir/usr/share/$pkgname/options"
  install -D -m755 code/fs2_open_$pkgver "$pkgdir/opt/$pkgname/fs2_open_$pkgver"
  install -D -m755 "../fs2_open" "$pkgdir/usr/bin/fs2_open"
}
