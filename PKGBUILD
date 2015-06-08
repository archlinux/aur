# Maintainer: willemw <willemw12@gmail.com>

_pkgname=cstitch
pkgname=$_pkgname-git
pkgver=0.9.6.r3.gf37d8bc
pkgrel=1
pkgdesc="Create cross stitch patterns from images"
arch=('i686' 'x86_64')
url="http://cstitch.sourceforge.net"
license=('GPL3')
depends=('gtk-update-icon-cache' 'qt5-base' 'libxkbcommon-x11')
makedepends=('git' 'python2' 'unzip')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
#source=($_pkgname::git://github.com/kleintom/Cstitch.git
source=($_pkgname::git://git.code.sf.net/p/cstitch/code
        http://sourceforge.net/projects/cstitch/files/Cstitch/Icons/icons.zip)
md5sums=('SKIP'
         '35547a4cf78635e68ba22ba3c526fbda')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  # Get icons
  unzip "$srcdir/icons.zip" -d icons/

  # Generate documentation
  python2 doc/createDocs.py

  # Undo any Qt3 configuration (/etc/profile.d/qt3.sh)
  unset QTDIR QT_XFT PKG_CONFIG_PATH
  PATH="$(echo $PATH | /usr/bin/sed "s|[:]*/opt/qt/bin||g")"

  # Build
  qmake-qt5 -project
  python2 ./progen.py
  qmake-qt5
  make
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 cstitch.desktop "$pkgdir/usr/share/applications/cstitch.desktop"
  install -Dm644 icons/cstitch.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/cstitch.svg"
}

