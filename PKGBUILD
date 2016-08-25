# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

# based on marble from [extra]

# Please make sure to build this package in a clean chroot, see https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot otherwise the depends and makedepends will very likely be wrong.

_pkgname=marble
pkgname=$_pkgname-qt
pkgver=16.04.3
pkgrel=1
pkgdesc="Desktop Globe - Qt version"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.kde.org/applications/system/marble"
license=('GPL')
depends=('qt5-webkit' 'hicolor-icon-theme' 'desktop-file-utils' 'qt5-svg' 'qt5-script')
makedepends=('cmake' 'qt5-tools')
provides=("$_pkgname" 'marble-data' 'libastro')
conflicts=("$_pkgname" 'marble-data' 'libastro')
source=("http://download.kde.org/stable/applications/$pkgver/src/$_pkgname-$pkgver.tar.xz")
md5sums=('e2e6315ba8277027f03ee2b5fe9c84a6')

prepare() {
  mkdir -p build

  # only build the QT app
  sed -e '/mobile/d' \
      -e '/Quick/d' \
      -e '/touch/d' \
      -e '/kde/d' \
      -i $_pkgname-$pkgver/src/apps/CMakeLists.txt
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DQT_PLUGINS_DIR=lib/qt/plugins \
    -DBUILD_TESTING=OFF \
    -DBUILD_MARBLE_EXAMPLES=OFF \
    -DBUILD_MARBLE_TESTS=OFF \
    -DMOBILE=OFF \
    -DQTONLY=ON \
    -DWITH_KF5=FALSE # added this line because of what https://marble.kde.org/sources.php suggests
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
