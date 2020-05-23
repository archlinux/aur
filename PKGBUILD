_basename=kdiff3
pkgname=${_basename}-git
pkgver=1.8.70.r1305.ab3a79d
pkgrel=1
pkgdesc="A KDE file comparator/merge tool"
arch=('i686' 'x86_64')
url="https://cgit.kde.org/kdiff3.git"
license=('GPL')
depends=('kparts' 'hicolor-icon-theme')
conflicts=("$_basename" "${_basename}-kf5-git" "${_basename}-qt")
makedepends=('cmake' 'extra-cmake-modules' 'git' 'kdoctools' 'boost')
source=("git+https://github.com/KDE/kdiff3.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_basename}"
  ver=`grep -Po 'ecm_setup_version\(\K([0-9.]+)' CMakeLists.txt`
  printf "%s.r%s.%s" "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
