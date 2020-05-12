# Maintainer: Nicolai.Pudimat <$maintainer@aol.de>
pkgname=psychonauts-gog
pkgver=2.0.0.4
pkgrel=1
pkgdesc="A platforming game by Double Fine Productions (GOG version)"
conflicts=('psychonauts')
arch=('x86_64')
url="https://www.gog.com/game/psychonauts"
license=('custom: commercial')
depends=('lib32-sdl' 'lib32-openal' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('unzip')
source=("psychonauts-gog.desktop"
        "psychonauts-gog.sh"
        "gog_psychonauts_$pkgver.sh::gog://gog_psychonauts_$pkgver.sh")
md5sums=('a4d91ef0270b1734338252c928f59354'
         'ab9c3c8d8ba61e9c1be6feefe9ad18db'
         '7fc85f71494ff5d37940e9971c0b0c55')

DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Please\ download\ the\ file\ off\ gog.com\ and\ put\ it\ in\ this\ directory.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
PKGEXT=".pkg.tar"

prepare() {
  tail -c+873825 gog_psychonauts_${pkgver}.sh > gog_psychonauts.zip
  unzip -quo gog_psychonauts.zip
}

package() {
  install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/psychonauts

  cd data/noarch
  install -Dm644 support/icon.png "$pkgdir"/usr/share/pixmaps/psychonauts.png

  # remove libraries shipped with the game
  rm game/{libSDL-1.2.so.0,libopenal.so.1}

  install -d "$pkgdir"/opt/"$pkgname"/support
  cp -rp start.sh game "$pkgdir"/opt/"$pkgname"
  cp -p support/gog_com.shlib "$pkgdir"/opt/"$pkgname"/support

  install -d "$pkgdir"/usr/share/{doc,licenses}/"$pkgname"
  install -m644 docs/"Psychonauts Manual Win.pdf" "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 docs/"End User License Agreement.txt" "$pkgdir"/usr/share/licenses/"$pkgname"

}

# vim:set ts=2 sw=2 et:
