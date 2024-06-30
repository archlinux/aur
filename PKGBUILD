# Contributor: Daniel Maslowski <info@oragnecms.org>
# Contributor: mid-kid <esteve.varela@gmail.com>
# based on https://github.com/aur-archive/qt-ponies-git/blob/master/PKGBUILD
_gitname="qt-ponies"
pkgname=qt-ponies-git
pkgver=0.9.r3.g882a8cf
pkgrel=1
pkgdesc="Desktop ponies in Qt"
arch=("x86_64")
url="https://github.com/myszha/qt-ponies"
license=('GPL-3.0-or-later')
depends=("qt5-base" "libxfixes")
makedepends=("git")
provides=("qt-ponies")
source=(
  "git+${url}.git"
  "qt-ponies-qt5.patch"
  "qt-ponies-qt5.14.patch"
)
sha256sums=('SKIP'
            '5681360eb583cd25d42200abda9c01c050db69778c63a8a2ab79b6ecbb441034'
            'cb7019e0dd6bdbf335ffd52748cd60a58e1ef15e81974b4db58fb5bee1db5f88')


pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  # Set default desktop-ponies directory
  sed -i "s/.\/desktop-ponies/\/usr\/share\/qt-ponies\/desktop-ponies/g" src/configwindow.cpp
  # Patch for Qt5 - big kudos to Kiwii for this :)
  patch -p1 < "$srcdir/qt-ponies-qt5.patch"
  # Patch for Qt5.14
  patch -p1 < "$srcdir/qt-ponies-qt5.14.patch"
}

package() {
  cd "$srcdir/$_gitname"
  qmake-qt5
  make
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
