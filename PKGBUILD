# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=gzdoom-git
pkgver=2.1.pre.r1486.g86797b4
pkgrel=1
pkgdesc="Doom source port based on ZDoom with an OpenGL renderer (git version)."
arch=('i686' 'x86_64')
url="http://forum.drdteam.org/viewforum.php?f=22"
license=('custom')
depends=('fluidsynth' 'fmodex4.26.36' 'glew' 'gtk2' 'gxmessage' 'sdl2')
makedepends=('nasm' 'cmake' 'git' 'imagemagick' 'mesa')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'freedoom: FreeDoom game data'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'strife0-wad: Strife shareware game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data')
provides=('gzdoom')
conflicts=('gzdoom')
source=(gzdoom::git://github.com/coelckers/gzdoom.git \
        doom-share-dir.patch \
        stack-noexec.patch \
        gzdoom.desktop)
sha256sums=('SKIP'
            '7fa660bdff8dd0aa9151173c2ddc9122e639d3b0a2c6f98573d37b92765bab7d'
            'a23277cc90ef8bd720417b097609ede6f5054b252843742209f794e0d1306205'
            '2a0b837ddc423d3a6be50f60735c55ee27cd26f58c42540b44aab395030b9cc4')

_fmodver=4.26.36
_libdir=/usr/lib/gzdoom
_sharedir=/usr/share/games/gzdoom

pkgver() {
  cd gzdoom

  git describe --long --tags --match '[Gg]*' | sed -r 's/^[Gg]//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd gzdoom

  patch -p1 <"$srcdir/doom-share-dir.patch"
  patch -p1 <"$srcdir/stack-noexec.patch"

  sed -i "s|setPluginPath(progdir)|setPluginPath(\"$_libdir\")|" src/sound/fmodsound.cpp
}

build() {
  cd gzdoom

  cmake -DFMOD_INCLUDE_DIR=/usr/include/fmodex-$_fmodver \
        -DFMOD_LIBRARY=/usr/lib/libfmodex-$_fmodver.so \
        -DCMAKE_C_FLAGS="$CFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" \
        .
  make

  convert "src/win32/icon1.ico[2]" gzdoom.png
}

package() {
  cd gzdoom

  install -Dm755 gzdoom "$pkgdir/usr/bin/gzdoom"
  install -Dm755 liboutput_sdl.so "$pkgdir/$_libdir/liboutput_sdl.so"
  install -Dm644 gzdoom.pk3 "$pkgdir/$_sharedir/gzdoom.pk3"
  install -Dm644 brightmaps.pk3 "$pkgdir/$_sharedir/brightmaps.pk3"
  install -Dm644 lights.pk3 "$pkgdir/$_sharedir/lights.pk3"
  ln -s /usr/share/doom/doom.wad "$pkgdir/$_sharedir/freedoomu.wad"
  ln -s /usr/share/doom/doom2.wad "$pkgdir/$_sharedir/freedoom.wad"
  ln -s /usr/share/doom/hexen.wad "$pkgdir/$_sharedir/hexendemo.wad"

  install -Dm644 gzdoom.png "$pkgdir/usr/share/pixmaps/gzdoom.png"
  install -Dm644 "$srcdir/gzdoom.desktop" "$pkgdir/usr/share/applications/gzdoom.desktop"
  install -Dm644 docs/BUILDLIC.TXT "$pkgdir/usr/share/licenses/$pkgname/buildlic.txt"
  install -Dm644 docs/doomlic.txt "$pkgdir/usr/share/licenses/$pkgname/doomlic.txt"
}
