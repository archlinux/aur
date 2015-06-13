# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=meritous
pkgver=v12
pkgrel=1
pkgdesc="An action-adventure dungeon crawl game"
arch=('i686' 'x86_64')
url='http://www.asceai.net/meritous/'
license=('GPL3')
depends=('sdl_image' 'sdl_mixer')
source=("http://www.asceai.net/files/${pkgname}_${pkgver}_src.tar.bz2")
md5sums=('88e439c773ee0e334fd2b256100983b8')

build() {
  cd meritous_${pkgver}_src

  sed -i 's|dat/|/usr/share/meritous/dat/|g' src/*.c
  sed -i 's|SaveFile.sav|/var/games/meritous/&|' src/*.c
  sed -i 's/for (i = 9/for (i = 8/' src/boss.c
  sed -i 's/((final_boss_dlg == 0) && (current_boss == 3))/(final_boss_dlg == 0)/' src/boss.c 
  sed -i $'s/\r$//' dat/d/helpfile.txt
  sed -i 's/^LDFLAGS = .*$/& -lm/' Makefile

  make CCFLAGS="$CFLAGS $(sdl-config --cflags)"
}

package()
{
  cd meritous_${pkgver}_src
  mkdir -p "$pkgdir"/usr/{bin,share/$pkgname}
  install -d -g games -m775 "$pkgdir/var/games/meritous/"
  install -m755 $pkgname "$pkgdir/usr/bin/"
  cp -rf dat/ "$pkgdir/usr/share/$pkgname/"
}

# vim:set ts=2 sw=2 et:
