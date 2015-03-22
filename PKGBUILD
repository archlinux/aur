# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=gzdoom1
pkgver=1.8.10
pkgrel=1
pkgdesc="Doom source port based on ZDoom with an OpenGL renderer (legacy version)."
arch=('i686' 'x86_64')
url="http://www.osnanet.de/c.oelckers/gzdoom/"
license=('custom')
depends=('fluidsynth' 'fmodex4.26.36' 'glew' 'gtk2' 'gxmessage' 'sdl2')
makedepends=('nasm' 'cmake' 'imagemagick' 'mesa')
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
source=(https://github.com/coelckers/gzdoom/archive/${pkgver}.tar.gz
        gitinfo.h
        git-c915049.patch
        git-37321d1.patch
        git-cab509c.patch
        git-fb3bf0e.patch
        config-update-fix.patch
        doom-share-dir.patch
        stack-noexec.patch
        gzdoom.desktop)
md5sums=('96eff26bd5f200002ae9b2a81b19451d'
         '87e0ce206bdb5481a5af5ca37d2a073e'
         'bc817312edc685a2823c9579723a43aa'
         '25c80530b4540bf805a5b14a22b8ec37'
         '5536e58fdeb11a7618f39bc5a325dafe'
         '94d5d45d4fab4896c4c20b9daeacdb46'
         'eed301389f533effbd127681a3ddc2c5'
         '3ee3d6bb1f777445438bc40ae81a95df'
         '4778bb22190c445a4ed764c64432de12'
         '3f5920d839086c9ad04ed1338c3fb546')

_fmodver=4.26.36
_libdir=/usr/lib/gzdoom
_sharedir=/usr/share/games/gzdoom

prepare() {
  cd gzdoom-$pkgver

  cp "$srcdir"/gitinfo.h src/gitinfo.h

  patch -p1 <"$srcdir"/git-c915049.patch
  patch -p1 <"$srcdir"/git-37321d1.patch
  patch -p1 <"$srcdir"/git-cab509c.patch
  patch -p1 <"$srcdir"/git-fb3bf0e.patch

  patch -p1 <"$srcdir/config-update-fix.patch"
  patch -p1 <"$srcdir/doom-share-dir.patch"
  patch -p1 <"$srcdir/stack-noexec.patch"

  sed -i "s|setPluginPath(progdir)|setPluginPath(\"$_libdir\")|" src/sound/fmodsound.cpp
}

build() {
  cd gzdoom-$pkgver

  cmake -DFMOD_INCLUDE_DIR=/usr/include/fmodex-$_fmodver \
        -DFMOD_LIBRARY=/usr/lib/libfmodex-$_fmodver.so \
        -DCMAKE_C_FLAGS="$CFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"$_sharedir\\\"" \
        .
  make

  convert "src/win32/icon1.ico[2]" gzdoom.png
}

package() {
  cd gzdoom-$pkgver

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
