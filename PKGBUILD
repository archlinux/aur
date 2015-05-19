# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=zdoom-git
pkgver=2.8pre.r1130.g72506fa
pkgrel=1
pkgdesc="An enhanced Doom port with additional support for Heretic, Hexen and Strife (git version)."
arch=('i686' 'x86_64')
url="http://www.zdoom.org/"
license=('custom')
depends=('fluidsynth' 'fmodex4.26.36' 'gtk2' 'gxmessage' 'sdl2')
makedepends=('nasm' 'cmake' 'git' 'imagemagick')
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
provides=('zdoom')
conflicts=('zdoom')
source=(zdoom::git://github.com/rheit/zdoom.git \
        doom-share-dir.patch \
        stack-noexec.patch \
        zdoom.desktop)
sha256sums=('SKIP'
            '6ee28485ecb282157134c1621f9514c29db461b2c996eeee344b6bb59e7212c0'
            '0a6c16cbc3b7f9a23232eb8683c9d04333efec91318790bc280ce8a38dea2748'
            '2badd2c2de643172242c441f5e4aedb8c3c6969b10a7e87f8fc83f257b64c1b0')

_fmodver=4.26.36
_libdir=/usr/lib/zdoom
_sharedir=/usr/share/games/zdoom

pkgver() {
  cd zdoom

  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd zdoom

  patch -p1 <"$srcdir/doom-share-dir.patch"
  patch -p1 <"$srcdir/stack-noexec.patch"

  sed -i "s|setPluginPath(progdir)|setPluginPath(\"$_libdir\")|" src/sound/fmodsound.cpp
}

build() {
  cd zdoom

  cmake -DFMOD_INCLUDE_DIR=/usr/include/fmodex-$_fmodver \
        -DFMOD_LIBRARY=/usr/lib/libfmodex-$_fmodver.so \
        -DCMAKE_C_FLAGS="$CFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" \
        .
  make

  convert "src/win32/icon1.ico[2]" zdoom.png
}

package() {
  cd zdoom

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
