# Maintainer: willemw <willemw12@gmail.com>

pkgname=cstitch-git
pkgver=0.9.8.r1.gd9a8b1f
pkgrel=1
pkgdesc="Create cross stitch patterns from images"
arch=('i686' 'x86_64')
url="http://cstitch.sourceforge.net"
license=('GPL3')
depends=('qt5-base' 'libxkbcommon-x11')
makedepends=('git' 'python' 'unzip')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#source=($pkgname::git+https://github.com/kleintom/Cstitch.git
source=($pkgname::git+https://git.code.sf.net/p/cstitch/code
        http://sourceforge.net/projects/cstitch/files/Cstitch/Icons/icons.zip)
md5sums=('SKIP'
         '35547a4cf78635e68ba22ba3c526fbda')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  # Get icons
  unzip "$srcdir/icons.zip" -d icons/

  # Generate documentation
  python doc/createDocs.py

  # Undo any Qt3 configuration (/etc/profile.d/qt3.sh)
  unset QTDIR QT_XFT PKG_CONFIG_PATH
  PATH="$(echo $PATH | /usr/bin/sed "s|[:]*/opt/qt/bin||g")"

  # Build
  qmake-qt5 -project
  python ./progen.py
  qmake-qt5
  make
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 cstitch.desktop "$pkgdir/usr/share/applications/cstitch.desktop"
  install -Dm644 icons/cstitch.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/cstitch.svg"
}

