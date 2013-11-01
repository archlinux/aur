# Contributor: Andrew Rabert <arabert@nullsum.net>
# Contributor: Jan Cholasta <grubber at grubber cz>
# Maintainer: Jan Cholasta <grubber at grubber cz>

_fmodver=42636
_fmodarch=linux
if [[ "$CARCH" == x86_64 ]]; then
  _fmodarch=linux64
fi

pkgname=zdoom
pkgver=2.7.1
pkgrel=2
pkgdesc="An enhanced Doom port with additional support for Heretic, Hexen and Strife."
arch=('i686' 'x86_64')
url="http://www.zdoom.org/"
license=('custom')
depends=('fluidsynth' 'gxmessage' 'sdl')
makedepends=('nasm' 'cmake' 'imagemagick' 'p7zip')
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
source=(http://zdoom.org/files/zdoom/2.7/zdoom-$pkgver-src.7z \
        http://www.fmod.org/download/fmodex/api/Linux/fmodapi${_fmodver}${_fmodarch}.tar.gz \
        doom-share-dir.patch \
        stack-noexec.patch \
        zdoom.desktop)
noextract=(zdoom-$pkgver-src.7z)
md5sums=('900a13cca9283fa91874210eeef0c839'
         '355cba00a34eb5f7d027da68b452f6d9'
         '4885de42e92dc1d5250db561f7ce9537'
         '7437cdf6478360c87649564e6e1dcb3b'
         '83e47fdae2768da78cd4ac151ec92ad1')

if [[ "$CARCH" == i?86 ]]; then
  md5sums[1]='220a54f330bdf3056d6207a0facf2096'
elif [[ "$CARCH" == x86_64 ]]; then
  md5sums[1]='355cba00a34eb5f7d027da68b452f6d9'
fi

_libdir=/usr/lib/zdoom
_sharedir=/usr/share/games/zdoom

prepare() {
  7z x -y -o$pkgname-$pkgver zdoom-$pkgver-src.7z &>/dev/null

  cd $pkgname-$pkgver

  patch -p1 <"$srcdir/doom-share-dir.patch"
  patch -p1 <"$srcdir/stack-noexec.patch"

  sed -i "s|setPluginPath(progdir)|setPluginPath(\"$_libdir\")|" src/sound/fmodsound.cpp
}

build() {
  cd $pkgname-$pkgver

  local _fmodlib
  if [[ "$CARCH" == i?86 ]]; then
    _fmodlib=libfmodex-${_fmodver:0:1}.${_fmodver:1:2}.${_fmodver:3:2}.so
  elif [[ "$CARCH" == x86_64 ]]; then
    _fmodlib=libfmodex64-${_fmodver:0:1}.${_fmodver:1:2}.${_fmodver:3:2}.so
  fi

  cp "$srcdir/fmodapi${_fmodver}${_fmodarch}/api/lib/$_fmodlib" libzdoom-fmodex.so

  cmake -DFMOD_INCLUDE_DIR="$srcdir/fmodapi${_fmodver}${_fmodarch}/api/inc" \
        -DFMOD_LIBRARY=libzdoom-fmodex.so \
        -DCMAKE_C_FLAGS="$CFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" \
        -DCMAKE_SKIP_BUILD_RPATH=1 \
        .
  make

  convert "src/win32/icon1.ico[2]" zdoom.png
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 libzdoom-fmodex.so "$pkgdir/usr/lib/libzdoom-fmodex.so"

  install -Dm755 zdoom "$pkgdir/usr/bin/zdoom"
  install -Dm755 liboutput_sdl.so "$pkgdir/$_libdir/liboutput_sdl.so"
  install -Dm644 zdoom.pk3 "$pkgdir/$_sharedir/zdoom.pk3"
  ln -s /usr/share/doom/doom.wad "$pkgdir/$_sharedir/freedoomu.wad"
  ln -s /usr/share/doom/doom2.wad "$pkgdir/$_sharedir/freedoom.wad"
  ln -s /usr/share/doom/hexen.wad "$pkgdir/$_sharedir/hexendemo.wad"

  install -Dm644 zdoom.png "$pkgdir/usr/share/pixmaps/zdoom.png"
  install -Dm644 "$srcdir/zdoom.desktop" "$pkgdir/usr/share/applications/zdoom.desktop"
  install -Dm644 docs/BUILDLIC.TXT "$pkgdir/usr/share/licenses/$pkgname/BUILDLIC.TXT"
  install -Dm644 docs/doomlic.txt "$pkgdir/usr/share/licenses/$pkgname/DOOMLIC.TXT"
}
