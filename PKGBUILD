# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

# Don't compress with UPX, don't dump symbols to speed up compiling
_buildflags="NOUPX=1 NOOBJDUMP=1 "

pkgname=srb2kart
pkgver=1.6
_dataver=1.6
pkgrel=2
pkgdesc="Source code modification of Sonic Robo Blast 2 with kart racing elements"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url='https://mb.srb2.org/showthread.php?t=43708'
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2kart-data>=$_dataver" 'curl' 'discord-rpc')
makedepends=('mesa' 'glu' 'git')
makedepends_i686=('nasm')

options=(!buildflags)
source=("git+https://github.com/STJr/Kart-Public.git#tag=v$pkgver"
  "srb2kart.desktop"
  "srb2kart-opengl.desktop")
sha256sums=('SKIP'
            '17f9d878d365c98f1d31bb895426f0b49378c49c87921f5ecfa01bd803a36591'
            'dea04abae8639a7bbf081ea40ff0c7c5ffa34c95e8295d37613b632d5452df73')

build() {
  cd "$srcdir"/Kart-Public/src

  [ "$CARCH" == "x86_64" -o "$CARCH" == "aarch64" ] && _buildflags+="LINUX64=1 " || _buildflags+="LINUX=1 "

  export CFLAGS="${CFLAGS} -std=gnu99"
  _buildflags+="HAVE_DISCORDRPC=1"

  echo "Build options: $_buildflags"
  make $_buildflags
}

package() {
  [ "$CARCH" == "x86_64" -o "$CARCH" == "aarch64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 "$srcdir"/Kart-Public/bin/Linux$IS64BIT/Release/lsdl2srb2kart \
    "$pkgdir"/usr/bin/srb2kart

  # icon + .desktop
  install -Dm644 "$srcdir"/Kart-Public/src/sdl/SDL_icon.xpm \
    "$pkgdir"/usr/share/pixmaps/srb2kart.xpm
  install -Dm644 srb2kart.desktop "$pkgdir"/usr/share/applications/srb2kart.desktop
  install -m644 srb2kart-opengl.desktop "$pkgdir"/usr/share/applications
}
