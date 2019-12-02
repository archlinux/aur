# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sebastian Voecking <voeck@web.de>

pkgbase=mp-5
pkgname=(mp-5-gtk mp-5-nc mp-5-qt5)
pkgver=5.36
pkgrel=1
arch=('x86_64')
url="http://www.triptico.com/software/mp.html"
license=('GPL')
#'mp_doccer' 'perl-grutatxt'
makedepends=('gtk3' 'ncurses' 'qt5-base')
options=(!makeflags)
#source=(https://github.com/angelortega/mp-5.x/archive/$pkgver.tar.gz)
source=(http://triptico.com/download/mp/mp-$pkgver.tar.gz)
md5sums=('74717998237eae0ce5c5e5184c13f5e5')

prepare() {
  # Patch hard-coded install paths
  sed -i 's| /usr| $(PREFIX)|g' mp-$pkgver/makefile.in

  rm -rf mp-5-gtk
  cp -a mp-$pkgver mp-5-gtk

  rm -rf mp-5-nc
  cp -a mp-$pkgver mp-5-nc

  rm -rf mp-5-qt5
  cp -a mp-$pkgver mp-5-qt5
}

# Note: config.sh detects during the build which libraries are available
build() {
  cd "$srcdir/mp-5-gtk"
  ./config.sh --prefix=/usr --without-curses --without-kde4 --without-qt
  make

  cd "$srcdir/mp-5-nc"
  ./config.sh --prefix=/usr --without-gtk --without-kde4 --without-qt
  make

  cd "$srcdir/mp-5-qt5"
  ./config.sh --prefix=/usr --without-curses --without-gtk --without-kde4 --without-qt4
  make
}

package_mp-5-gtk() {
  pkgdesc="Text editor for programmers (GTK front-end)"
  depends=('gtk3')
  _pkgname='mp-5'
  provides=($_pkgname)
  conflicts=($_pkgname)

  cd mp-5-gtk
  #install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
  install -dm755 "$pkgdir"{/usr/bin,/usr/share/applications,/usr/share/icons/hicolor/48x48/apps}
  make DESTDIR="$pkgdir" install
}

package_mp-5-nc() {
  pkgdesc="Text editor for programmers (ncurses front-end)"
  depends=('ncurses')
  _pkgname='mp-5'
  provides=($_pkgname)
  conflicts=($_pkgname)

  cd mp-5-nc
  #install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
  install -dm755 "$pkgdir"{/usr/bin,/usr/share/applications,/usr/share/icons/hicolor/48x48/apps}
  make DESTDIR="$pkgdir" install
}

package_mp-5-qt5() {
  pkgdesc="Text editor for programmers (QT5 front-end)"
  depends=('qt5-base')
  _pkgname='mp-5'
  provides=($_pkgname)
  conflicts=($_pkgname)

  cd mp-5-qt5
  #install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
  install -dm755 "$pkgdir"{/usr/bin,/usr/share/applications,/usr/share/icons/hicolor/48x48/apps}
  make DESTDIR="$pkgdir" install
}

