# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=konversation-git
pkgver=1.8.210770.r8944.9288fab5
pkgrel=1
pkgdesc="A user friendly IRC client for KDE. (GIT Version)"
arch=('x86_64')
url='https://kde.org/applications/en/internet/org.kde.konversation'
license=('GPL2' 'FDL')
makedepends=('git'
             'extra-cmake-modules'
             'kdoctools'
             'python'
             )
depends=('knotifyconfig'
         'kemoticons'
         'kparts'
         'kidletime'
         'qca-qt5'
         'hicolor-icon-theme'
         )
optdepends=('python: python scripting support')
conflicts=('konversation')
provides=('konversation')
source=('git+https://invent.kde.org/network/konversation.git')
sha256sums=('SKIP')

pkgver() {
  cd konversation
  _ver="$(cat CMakeLists.txt | grep "set(KONVERSATION_BASE_VERSION" | cut -d '"' -f2)"
  _vermaj="$(cat CMakeLists.txt | grep "RELEASE_SERVICE_VERSION_MAJOR" -m1 | cut -d '"' -f2)"
  _vermin="$(cat CMakeLists.txt | grep "RELEASE_SERVICE_VERSION_MINOR" -m1 | cut -d '"' -f2)"
  _vermic="$(cat CMakeLists.txt | grep "RELEASE_SERVICE_VERSION_MICRO" -m1 | cut -d '"' -f2)"
  echo "${_ver}.${_vermaj}${_vermin}${_vermic}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../konversation \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
