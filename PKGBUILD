# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=raine
pkgver=0.97.4
pkgrel=1
pkgdesc="A multiple arcade emulator focused on 680x0/z80 machines like NeoCD and Neo Geo, C version"
url="http://raine.1emulation.com/"
license=('custom')
arch=('any')
replaces=('neoraine' 'raine64')
depends=('sdl2_ttf' 'sdl2_image' 'sdl2_sound' 'muparser' 'glu')
makedepends=('mesa')
source=(raine-$pkgver.tar.gz::"https://github.com/zelurker/raine/archive/$pkgver.tar.gz")
sha256sums=('4ee7b0bd67ebfa4ea946edb7f01b105faee78eeb1d9324d229f015748c1254ea')
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
