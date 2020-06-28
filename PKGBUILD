# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sebastian Voecking <voeck@web.de>

# NOTE: config.sh detects during the build which libraries (gtk, qt5, ...) are available

pkgbase=mp-5
pkgname=(mp-5-gtk mp-5-nc mp-5-qt5)
pkgver=5.41
pkgrel=1
arch=('x86_64')
url="https://triptico.com/software/mp.html"
license=('Unlicense')
#'mp_doccer' 'perl-grutatxt'
makedepends=('gtk3' 'ncurses' 'qt5-base')
options=(!makeflags)
source=("https://triptico.com/download/mp/mp-$pkgver.tar.gz")
md5sums=('f088e46e156a88adf3cccf752805348e')

prepare() {
  # Patch hard-coded install paths
  sed -i 's| /usr| $(PREFIX)|g' mp-$pkgver/makefile.in

  # Copy source files for each package
  # Patch: move subfolders "mpdm" and "mpsl" one folder up
  for DIR in mp-5-gtk mp-5-nc mp-5-qt5; do
    rm -rf "$DIR"
    cp -a mp-$pkgver "$DIR"
    rm -rf "$DIR/"{mpdm,mpsl}
  done
  cp -a mp-$pkgver/{mpdm,mpsl} .
}

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

