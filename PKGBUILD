# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=childsplay-git
_pkgname=childsplay
pkgver=r19.b61e8ed
pkgrel=1
pkgdesc="A suite of educational games for young children (git)"
url="http://www.childsplay.mobi"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2-pygame' 'pygtk' 'python2-sqlalchemy' 'python2-numpy')
makedepends=('git')
install=childsplay.install
conflicts=('childsplay')

source=("${pkgname}"::'git://git.savannah.nongnu.org/childsplay.git' childsplay.desktop childsplay.sh)

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # a hack for missing png
  cd "$srcdir/${pkgname}"
  cp lib/SPData/themes/childsplay/menuicons/memory_sp.icon.png lib/SPData/themes/childsplay/menuicons/math_test.icon.png
  # put alphabet sounds into correct place
  find alphabet-sounds/*/AlphabetSounds -mindepth 1 -type d | grep -v lt | while read -r langcode
	do
	mv "${langcode}" ${srcdir}/${pkgname}/alphabetsounds
	done
}

package() {
  cd "$srcdir/${pkgname}"
  mkdir -p "$pkgdir/usr/local/games/" 
  cp -R . "$pkgdir/usr/local/games/$_pkgname"


  install -D -m755 "$srcdir/childsplay.sh" "$pkgdir/usr/bin/childsplay"
  install -D -m644 "$srcdir/childsplay.desktop" \
                   "$pkgdir/usr/share/applications/childsplay.desktop"
  install -D -m644 "lib/SPData/themes/childsplay/logo_cp_32x32.xpm" \
                   "$pkgdir/usr/share/pixmaps/childsplay.xpm"
}
md5sums=('SKIP'
         '3aa3a801911797bf61a10e4cb7fd5e5a'
         '877612c362a8d282a689f63cb19a8083')
