# Maintainer: João Silva <mwksoul@gmail.com>

pkgname=kdesvn-git
pkgver=1.7.40.r2000.49083ff
pkgrel=1
pkgdesc="A pure C++ SVN-client for KDE. (GIT Version)"
arch=('i686' 'x86_64')
url='http://projects.kde.org/kdesvn'
license=('GPL')
depends=('kbookmarks' 'kconfig' 'kconfigwidgets' 'kcoreaddons'
         'kdbusaddons' 'kdoctools' 'ki18n' 'kiconthemes' 'kitemviews'
         'kjobwidgets' 'kio' 'knotifications' 'kparts' 'kservice'
         'ktexteditor' 'kwallet' 'kwidgetsaddons'
         'qt5-base'
         'subversion')
optdepends=('git')
makedepends=('git' 'extra-cmake-modules')
conflicts=('kdesvn')
provides=('kdesvn')
source=('git://anongit.kde.org/kdesvn.git')
sha1sums=('SKIP')
install=kdesvn-git.install

pkgver() {
  cd kdesvn
  _ver="$(cat CMakeLists.txt | grep -m3 -e KDESVN_VERSION_MAJOR -e KDESVN_VERSION_MINOR -e KDESVN_VERSION_PATCH | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdesvn \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DTESTINGBUILD=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
