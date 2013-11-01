# Contributor: Jan Cholasta <grubber at grubber cz>
# Maintainer: Jan Cholasta <grubber at grubber cz>

_fmodver=42636
_fmodarch=linux
if [[ "$CARCH" == x86_64 ]]; then
  _fmodarch=linux64
fi

pkgname=gzdoom-git
pkgver=20130829
pkgrel=1
pkgdesc="Doom source port based on ZDoom with an OpenGL renderer (git version)."
arch=('i686' 'x86_64')
url="http://www.osnanet.de/c.oelckers/gzdoom/"
license=('custom')
depends=('fluidsynth' 'gxmessage' 'sdl' 'glu')
makedepends=('nasm' 'cmake' 'git' 'imagemagick' 'mesa')
optdepends=('blasphemer: Blasphemer (free Heretic) game data'
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
        http://www.fmod.org/download/fmodex/api/Linux/fmodapi${_fmodver}${_fmodarch}.tar.gz \
        config-update-fix.patch \
        doom-share-dir.patch \
        stack-noexec.patch \
        gzdoom.desktop)
md5sums=('SKIP'
         '220a54f330bdf3056d6207a0facf2096'
         '2fda668ab449b7ca2d75a5b62dae6870'
         'ed6c7d1175146bedac3f5a59d09d8f4b'
         'b83081e982b742010df0afe36b4d49b6'
         '3f5920d839086c9ad04ed1338c3fb546')

if [[ "$CARCH" == i?86 ]]; then
  md5sums[1]='220a54f330bdf3056d6207a0facf2096'
elif [[ "$CARCH" == x86_64 ]]; then
  md5sums[1]='355cba00a34eb5f7d027da68b452f6d9'
fi

_libdir=/usr/lib/gzdoom
_sharedir=/usr/share/games/gzdoom

pkgver() {
  date +%Y%m%d
}

prepare() {
  cd gzdoom

  patch -p1 <"$srcdir/config-update-fix.patch"
  patch -p1 <"$srcdir/doom-share-dir.patch"
  patch -p1 <"$srcdir/stack-noexec.patch"

  sed -i "s|setPluginPath(progdir)|setPluginPath(\"$_libdir\")|" src/sound/fmodsound.cpp
}

build() {
  cd gzdoom

  local _fmodlib
  if [[ "$CARCH" == i?86 ]]; then
    _fmodlib=libfmodex-${_fmodver:0:1}.${_fmodver:1:2}.${_fmodver:3:2}.so
  elif [[ "$CARCH" == x86_64 ]]; then
    _fmodlib=libfmodex64-${_fmodver:0:1}.${_fmodver:1:2}.${_fmodver:3:2}.so
  fi

  cp "$srcdir/fmodapi${_fmodver}${_fmodarch}/api/lib/$_fmodlib" libfmodex.so

  cmake -DFMOD_INCLUDE_DIR="$srcdir/fmodapi${_fmodver}${_fmodarch}/api/inc" \
        -DFMOD_LIBRARY=libfmodex.so \
        -DCMAKE_C_FLAGS="$CFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" \
        -DCMAKE_INSTALL_RPATH=$_libdir \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=1 \
        -DCMAKE_SKIP_BUILD_RPATH=1 \
        .
  make

  convert "src/win32/icon1.ico[2]" gzdoom.png
}

package() {
  cd gzdoom

  install -Dm755 libfmodex.so "$pkgdir/$_libdir/libfmodex.so"

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
  install -Dm644 docs/BUILDLIC.TXT "$pkgdir/usr/share/licenses/$pkgname/BUILDLIC.TXT"
  install -Dm644 docs/doomlic.txt "$pkgdir/usr/share/licenses/$pkgname/DOOMLIC.TXT"
}
