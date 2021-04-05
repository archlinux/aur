# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=raine
pkgver=0.91.15b
pkgrel=1
pkgdesc="A multiple arcade emulator focused on 680x0/z80 machines like NeoCD and Neo Geo, C version"
url="http://raine.1emulation.com/"
license=('custom')
arch=('i686' 'x86_64')
replaces=('neoraine' 'raine64')
depends_i686=('sdl_ttf' 'sdl_image' 'sdl_sound' 'muparser' 'glu')
depends_x86_64=('sdl_ttf' 'sdl_image' 'sdl_sound' 'muparser' 'glu')
makedepends=('mesa')
optdepends=('raine-emudx: improved graphic and sound files for some classic games'
            'arcade-history-dat: database with various information about the loaded rom'
            'arcade-command-dat: database with button combinations for special moves in (mostly fighting) games')
source=(raine-$pkgver.tar.gz::"https://github.com/zelurker/raine/archive/$pkgver.tar.gz")
sha256sums=('4202004ad6dbd13995bf8e879c961ab4932990393443b2beccf87e911ddfe3e9')
options=('emptydirs')

prepare() {
  cd "$srcdir"
  mkdir -p raine-bin

  cd raine-$pkgver

  # adapt folder structure to arch standards
  sed 's|$(prefix)/games|\$(prefix)/bin|;s|$(prefix)/share/games|\$(prefix)/share|' -i makefile
  sed 's|share/games/raine|share/raine|' -i source/sdl/dialogs/about.cpp source/raine.c
}

build() {
  make NO_ASM=1 -C "$srcdir"/raine-$pkgver #VERBOSE=1
}

package() {
  cd "$srcdir/raine-$pkgver"
  make NO_ASM=1 DESTDIR="$pkgdir" install
  # doc + license
  install -d "$pkgdir"/usr/share/{doc,licenses}/raine
  install -m644 docs/* changes/* "$pkgdir"/usr/share/doc/raine
  head -n5 source/raine.c > "$pkgdir"/usr/share/licenses/raine/LICENSE
}
