_basename=kdiff3
_gitbranch=kf5
pkgname=${_basename}-${_gitbranch}-git
pkgver=1.7.90_3029480
pkgrel=1
pkgdesc="A KDE file comparator/merge tool"
arch=('i686' 'x86_64')
url="https://cgit.kde.org/kdiff3.git"
license=('GPL')
depends=('kparts' 'hicolor-icon-theme')
conflicts=("$_basename" "${_basename}-git" "${_basename}-${_gitbranch}" "${_basename}-qt")
makedepends=('cmake' 'extra-cmake-modules' 'git' 'kdoctools')
source=("git+https://github.com/KDE/kdiff3.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_basename"
  git describe --always | sed "s/-/./g" | sed "s/^/1.7.90_/g"
}

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake "$srcdir/$_basename"  \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
