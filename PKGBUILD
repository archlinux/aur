# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

_pkgname=kde-cli-tools
pkgname=$_pkgname-git
pkgver=r1769.5b2f620
pkgrel=1
pkgdesc="Tools based on KDE Frameworks 5 to better interact with the system (Git)"
arch=(i686 x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(kdesu kcmutils kinit kactivities)
makedepends=(extra-cmake-modules git kdoctools plasma-workspace)
optdepends=('plasma-workspace: for kcmshell5')
conflicts=(kde-cli-tools)
provides=(kde-cli-tools)
source=('git+https://github.com/KDE/kde-cli-tools.git')
groups=(plasma)
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_pkgname
  mkdir -p build
}

build() {
  cd $srcdir/$_pkgname/build
  cmake ../ \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING.LIB "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  ln -s /usr/lib/kf5/kdesu "$pkgdir"/usr/bin/
}
