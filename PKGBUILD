# Contributor: Dragonlord <dragonlord[at]seznam[.]cz>
pkgname=zangband
pkgver=2.7.5pre1
pkgrel=1
pkgdesc="Roguelike computer role playing game based on Angband"
arch=('i686')
url="http://www.zangband.org"
depends=('ncurses' 'lesstif')
makedepends=('ncurses')
license=('custom')
source=(http://downloads.sourceforge.net/zangband/$pkgname-$pkgver.tar.gz \
        LICENSE)
install=(zangband.install)

md5sums=('8ea43c1b13c54157558bfd0ad3cee295'
         '74183fd3880704df6ab64e4c2887b852')

build() {
  cd $startdir/src/$pkgname/src/

  cp "makefile.std" "makefile"
  cp "z-config.h" "z-config.h.bak"
  sed -e 's@# define DEFAULT_PATH "./lib/"@# define DEFAULT_PATH "/usr/lib/zangband/"@' z-config.h.bak > z-config.h
  cp "main.c" "main.c.bak"
  sed -e 's@strcpy(path, "./lib/");@strcpy(path, "/usr/lib/zangband/");@' main.c.bak > main.c

  cd "$startdir/src/$pkgname"

  ./configure --prefix=/usr/lib/ --with-gtk=no
  make

  install -d "$startdir/pkg/usr/bin" "$startdir/pkg/usr/lib/$pkgname"
  install -D -m755 "$pkgname" "$startdir/pkg/usr/bin/$pkgname"
  cp -R "$startdir/src/$pkgname/lib" "$startdir/pkg/usr/lib"
  rename "$startdir/pkg/usr/lib/lib" "$startdir/pkg/usr/lib/$pkgname" "$startdir/pkg/usr/lib/lib"
  chmod -R 775 "$startdir/pkg/usr/lib/$pkgname"
  chown -R root:users "$startdir/pkg/usr/lib/$pkgname"

  find "$startdir/pkg/usr/lib/$pkgnam" -name makefile.zb -exec rm {} \;
  find "$startdir/pkg/usr/lib/$pkgname" -type f -exec chmod a-x {} \;
  install -D -m644 "$startdir/src/LICENSE" "$startdir/pkg/usr/share/licenses/$pkgname/LICENSE"
}
