# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=raine
pkgver=0.64.5
_gitver=c09ecd56ce834bf602107960697a74d6977d0958
pkgrel=1
pkgdesc="A multiple arcade emulator focused on 680x0 machines like NeoCD and Neo Geo"
url="http://raine.1emulation.com/"
license=('custom')
arch=('i686' 'x86_64')
replaces=('neoraine')
depends_i686=('sdl_ttf' 'sdl_image' 'sdl_sound' 'muparser' 'glu')
depends_x86_64=('lib32-sdl_ttf' 'lib32-sdl_image' 'lib32-sdl_sound' 'lib32-muparser' 'lib32-glu')
makedepends=('nasm' 'mesa')
makedepends_x86_64=('gcc-multilib')
optdepends=('raine-artwork: additional background graphics for some games'
            'raine-emudx: improved graphic and sound files for some classic games'
            'raine-blend: transparency information for some games'
            'arcade-history-dat: database with various information about the loaded rom'
            'arcade-command-dat: database with button combinations for special moves in (mostly fighting) games')
source=(raine-$pkgver.tar.gz::"https://github.com/zelurker/raine/archive/$_gitver.tar.gz"
        "$url/archive/debian/dists/unstable/main/binary-i386/raine_${pkgver}-2_i386.deb")
sha256sums=('b43acd7c23f742148bf73fe57fc49e344e6392a50c1548590aeceafa04ff5147'
            'c917d1c17f23901cd160c24f1be0b504590f773b7f791e5a890875162d813d8f')
options=('emptydirs')

prepare() {
  cd "$srcdir"
  mkdir -p raine-bin
  bsdtar xf data.tar.xz -C raine-bin

  cd raine-$_gitver
  # copy bitmaps and fonts from raine's deb package
  cp -rup "$srcdir"/raine-bin/usr/share/games/raine/bitmaps .
  cp -rup "$srcdir"/raine-bin/usr/share/games/raine/fonts .

  # adapt folder structure to arch standards
  sed 's|$(prefix)/games|\$(prefix)/bin|;s|$(prefix)/share/games|\$(prefix)/share|' -i makefile
  sed 's|share/games/raine|share/raine|' -i source/sdl/dialogs/about.cpp source/raine.c

  # -O3 optimizations cause segfaults, use -O2 instead
  sed 's|-O3|-O2|g' -i makefile

  # link to the dynamic library of SDL_sound, not only for gentoo
  sed 's|ifeq ("$(shell uname -n)","gentoo")|ifdef RAINE_UNIX|' -i makefile

  # 'detect-cpu' script does not recognize most recent cpus, use generic optimizing
  echo "_MARCH=-march=${CARCH/x86_64/x86-64} -mtune=generic" > cpuinfo
  echo "CPU=generic" >> cpuinfo
}

build() {
  make -C "$srcdir"/raine-$_gitver #VERBOSE=1
}

package() {
  cd "$srcdir"/raine-$_gitver
  make DESTDIR="$pkgdir" install
  # doc + license
  install -d "$pkgdir"/usr/share/{doc,licenses}/raine
  install -m644 docs/* changes/* "$pkgdir"/usr/share/doc/raine
  head -n5 source/raine.c > "$pkgdir"/usr/share/licenses/raine/LICENSE
  # deprecate neoraine, both projects have been merged
  ln -s raine "$pkgdir"/usr/bin/neoraine
  rm "$pkgdir"/usr/share/{applications,pixmaps}/neoraine.*
}
