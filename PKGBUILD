# Contributor: Andrew Wong <andrew@wongdev.com>
_pkgbase="freeglut"
pkgbase="$_pkgbase-svn"
pkgname=("$_pkgbase-x11-svn" "$_pkgbase-wayland-svn")
pkgver=r1768
pkgrel=1
arch=('i686' 'x86_64')
url="http://freeglut.sourceforge.net/"
license=('MIT')
makedepends=('subversion' 'cmake' 'mesa' 'glu' 'wayland' 'libxxf86vm')
provides=('glut' 'freeglut' 'freeglut-svn')
conflicts=('glut' 'freeglut' 'freeglut-svn')
source=("svn+https://freeglut.svn.sourceforge.net/svnroot/freeglut/trunk/freeglut/freeglut/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  local ver="$(svnversion)"
  echo "r${ver//[[:alpha:]]}"
}

prepare() {
  mkdir -p "$srcdir/$_pkgbase/build-x11"
  mkdir -p "$srcdir/$_pkgbase/build-wayland"
}

package_freeglut-x11-svn() {
  depends=('libxi' 'libxrandr' 'libgl')
  pkgdesc="Provides functionality for small OpenGL programs; X11 version"

  cd "$srcdir/$_pkgbase/build-x11"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DFREEGLUT_BUILD_DEMOS=OFF
  make all
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}

package_freeglut-wayland-svn() {
  depends=('wayland' 'libxkbcommon' 'libgl')
  pkgdesc="Provides functionality for small OpenGL programs; Wayland version"

  cd "$srcdir/$_pkgbase/build-wayland"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DFREEGLUT_BUILD_DEMOS=OFF -DFREEGLUT_WAYLAND=ON
  make all
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
