# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=zangband
pkgver=2.7.5pre1
pkgrel=1
pkgdesc="Roguelike computer role playing game based on Angband"
arch=('i686' 'x86_64')
url="http://www.zangband.org"
license=('custom')
depends=('ncurses' 'lesstif')
makedepends=('ncurses')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz \
        LICENSE)
install=$pkgname.install
md5sums=('8ea43c1b13c54157558bfd0ad3cee295'
         '74183fd3880704df6ab64e4c2887b852')

prepare(){
  cd "${srcdir}"/$pkgname/src/

  cp "makefile.std" "makefile"
  cp "z-config.h" "z-config.h.bak"
  sed -e 's@# define DEFAULT_PATH "./lib/"@# define DEFAULT_PATH "/usr/lib/zangband/"@' z-config.h.bak > z-config.h
  cp "main.c" "main.c.bak"
  sed -e 's@strcpy(path, "./lib/");@strcpy(path, "/usr/lib/zangband/");@' main.c.bak > main.c
}

build() {
  cd "${srcdir}"/$pkgname

  ./configure --prefix=/usr/lib/ --with-gtk=no
  make
}

package() {
  cd "${srcdir}"/$pkgname

  install -d "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/$pkgname
  install -D -m755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  cp -R "${srcdir}"/$pkgname/lib "${pkgdir}"/usr/lib
  rename "${pkgdir}"/usr/lib/lib "${pkgdir}"/usr/lib/$pkgname "${pkgdir}"/usr/lib/lib
  chmod -R 775 "${pkgdir}"/usr/lib/$pkgname
  chown -R root:users "${pkgdir}"/usr/lib/$pkgname

  find "${pkgdir}"/usr/lib/$pkgnam -name makefile.zb -exec rm {} \;
  find "${pkgdir}"/usr/lib/$pkgname -type f -exec chmod a-x {} \;
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
