pkgname=warfork
pkgver=4269802.OCT.8.201
_dataver=4269802-OCT-8-2019
pkgrel=2
pkgdesc='Warfork'
arch=('i686' 'x86_64')
license=('GPL2')
url='https://github.com/TeamForbiddenLLC/warfork-qfusion'
depends=('sdl2' "warfork-data>=$_dataver")
makedepends=('cmake' 'libvorbis' 'libtheora' 'curl' 'zlib' 'freetype2' 'openal' 'mesa')
source=("https://github.com/TeamForbiddenLLC/warfork-qfusion/archive/${_dataver}.tar.gz"
        "warfork.desktop")
sha256sums=('SKIP'
'98faaf4fcb90753e88e303fda478ec195ae412a4bee5fb74cc3d94b6692c884a')

build() {
  cd "$srcdir"/warfork-qfusion-${_dataver}/source
  cmake .
  make -j7
}

package() {
  [ "$CARCH" == "x86_64" ] && EXT="x86_64" || EXT="i386"
  install -Dm644 warfork.desktop "$pkgdir"/usr/share/applications/warfork.desktop

  mkdir -p "$pkgdir"/usr/share/games/warfork/{libs,basewf}
  install -m755 "$srcdir"/warfork-qfusion-${_dataver}/source/build/{wf,warfork}* "$pkgdir"/usr/share/games/warfork
  install -Dm644 "$srcdir"/warfork-qfusion-${_dataver}/icons/warfork256x256.xpm "$pkgdir"/usr/share/pixmaps/warfork.xpm
  install -m644 "$srcdir"/warfork-qfusion-${_dataver}/source/build/libs/*.so "$pkgdir"/usr/share/games/warfork/libs
  install -m644 "$srcdir"/warfork-qfusion-${_dataver}/source/build/basewf/*.so "$pkgdir"/usr/share/games/warfork/basewf

  mkdir -p "$pkgdir"/usr/bin
  touch "$pkgdir"/usr/bin/warfork
  echo "#\!/bin/bash" > "$pkgdir"/usr/bin/warfork
  echo "pushd /usr/share/games/warfork > /dev/null" >> "$pkgdir"/usr/bin/warfork
  echo "./warfork.$EXT" >> "$pkgdir"/usr/bin/warfork
}
