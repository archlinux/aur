
pkgbase=libqgit2-git
pkgname=('libqgit2-qt4-git' 'libqgit2-qt5-git')
pkgver=0.22.1.r339.b4f0e31
pkgrel=1
pkgdesc='libgit2 bindings for Qt. (GIT Version)'
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/libs/libqgit2"
license=('GPL2')
makedepends=('cmake' 'git' 'qt5-base' 'qt4' 'libgit2-git')
source=('git://anongit.kde.org/libqgit2.git')
sha1sums=('SKIP')

pkgver() {
  cd libqgit2
  _ver="$(cat qgit2.h | grep LIBQGIT2_VERSION | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build-qt{4,5}
}

build() {
  cd "${srcdir}/build-qt4"
  cmake ../libqgit2 \
    -DQT4_BUILD=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBGIT2_TESTS=OFF
  make

  cd "${srcdir}/build-qt5"
  cmake ../libqgit2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBGIT2_TESTS=OFF
  make
}

package_libqgit2-qt4-git() {
  pkgdesc='libgit2 bindings for Qt4. (GIT Version)'
  depends=('qt4' 'libgit2-git')
  conflicts=('libqgit2-qt4' 'libqgit2-qt5' 'libqgit2-common-git')
  provides=('libqgit2-qt4')
  make -C build-qt4 DESTDIR="${pkgdir}" install
}

package_libqgit2-qt5-git() {
  pkgdesc='libgit2 bindings for Qt5. (GIT Version)'
  depends=('qt5-base' 'libgit2-git')
  conflicts=('libqgit2-qt5' 'libqgit2-qt4' 'libqgit2-common-git')
  provides=('libqgit2-qt5')
  make -C build-qt5 DESTDIR="${pkgdir}" install
}
