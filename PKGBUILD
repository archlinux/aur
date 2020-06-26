# Maintainer: Tajidin Abd <tajidinabd at archlinux dot us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=konsole-git
pkgver=r7247.91204ff0
pkgrel=1
pkgdesc="KDE's terminal emulator"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/applications/konsole'
license=('GPL' 'LGPL' 'FDL')
depends=('kbookmarks' 'kcompletion' 'kconfig' 'kconfigwidgets' 'kcoreaddons' 'kcrash' 'kguiaddons' 'kdbusaddons' 'ki18n' 'kiconthemes' 'kinit' 'kio' 'knewstuff' 'knotifications' 'knotifyconfig' 'kparts' 'kpty' 'kservice' 'ktextwidgets' 'kwidgetsaddons' 'kwindowsystem' 'kxmlgui' 'kglobalaccel')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
provides=('konsole')
conflicts=('konsole' 'kdebase-konsole')
source=('git+https://invent.kde.org/utilities/konsole.git')
md5sums=('SKIP')

pkgver() {
  cd konsole
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  BUILD_TYPE=Release
  if [[ " ${OPTIONS[@]} " =~ " debug " ]]; then
    BUILD_TYPE=RelDebug
  elif [[ " ${OPTIONS[@]} " =~ " !strip " ]]; then
    BUILD_TYPE=RelDebug
  fi
  echo "${BUILD_TYPE}"

  cmake ../konsole \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
