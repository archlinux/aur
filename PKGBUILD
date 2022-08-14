# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sebastian Voecking <voeck@web.de>

# NOTE: config.sh detects during the build which libraries (gtk, ...) are available

pkgbase=mp-5
#pkgname=(mp-5-gtk mp-5-nc mp-5-qt5)
pkgname=(mp-5-gtk mp-5-nc)
pkgver=5.59
pkgrel=1
arch=('x86_64')
url="https://triptico.com/software/mp.html"
license=('Unlicense')
#'mp_doccer' 'perl-grutatxt'
#makedepends=('gtk3' 'qt5-base')
makedepends=('gtk3')
options=(!makeflags)
#source=("$pkgbase-$pkgver.tar.gz::https://triptico.com/download/mp/mp-$pkgver.tar.gz")
source=("$pkgbase-$pkgver.tar.gz::https://triptico.com/download/mp-5.tar.gz")
sha256sums=('34f3f1daaf667dc8e15d01b4a7d6967a2b75002b03f1826d3024defe51b9a13a')

prepare() {
  # Patch hard-coded install paths
  #sed -i 's| /usr| $(PREFIX)|g' mp-$pkgver-dev/makefile.in
  sed -i 's| /usr| $(PREFIX)|g' mp-$pkgver/makefile.in

  # Copy source files for each package
  # Patch: move subfolders "mpdm" and "mpsl" one folder up
  #for dir in mp-5-gtk mp-5-nc mp-5-qt5; do
  for dir in mp-5-gtk mp-5-nc; do
    rm -rf "$dir"
    #cp -a mp-$pkgver-dev "$dir"
    cp -a mp-$pkgver "$dir"
    rm -rf "$dir/"{mpdm,mpsl}
  done
  #cp -a mp-$pkgver-dev/{mpdm,mpsl} .
  cp -a mp-$pkgver/{mpdm,mpsl} .
}

build() {
  set -x

  cd "$srcdir/mp-5-gtk"
  ./config.sh --prefix=/usr --without-curses --without-kde4 --without-qt
  make

  cd "$srcdir/mp-5-nc"
  ./config.sh --prefix=/usr --without-gtk --without-kde4 --without-qt
  make

  #cd "$srcdir/mp-5-qt5"
  #./config.sh --prefix=/usr --without-curses --without-gtk --without-kde4 --without-qt4
  #make
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
  _pkgname='mp-5'
  provides=($_pkgname)
  conflicts=($_pkgname)

  cd mp-5-nc
  #install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
  install -dm755 "$pkgdir"{/usr/bin,/usr/share/applications,/usr/share/icons/hicolor/48x48/apps}
  make DESTDIR="$pkgdir" install
}

#package_mp-5-qt5() {
#  pkgdesc="Text editor for programmers (QT5 front-end)"
#  depends=('qt5-base')
#  _pkgname='mp-5'
#  provides=($_pkgname)
#  conflicts=($_pkgname)
#
#  cd mp-5-qt5
#  #install -Dm644 mp.png "$pkgdir/usr/share/pixmaps/mp.png"
#  install -dm755 "$pkgdir"{/usr/bin,/usr/share/applications,/usr/share/icons/hicolor/48x48/apps}
#  make DESTDIR="$pkgdir" install
#}

