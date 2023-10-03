# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: A Rojas < nqn1976 @ gmail.com >

pkgname=partitionmanager-git
pkgver=23.11.70.r1851.276c76c
pkgrel=1
pkgdesc="A KDE utility that allows you to manage disks, partitions, and file systems. (GIT version)"
arch=('x86_64')
url='https://kde.org/applications/en/system/org.kde.partitionmanager'
license=('GPL2')
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libc.so
  'kpmcore' 'libkpmcore.so'
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5Widgets.so
  'polkit-qt5' #libpolkit-qt5-core-1.so
  'ki18n5' # libKF5I18n.so
  'kcrash5' # libKF5Crash.so
  'kjobwidgets5' # libKF5JobWidgets.so
  'kconfig5' # libKF5ConfigCore.so libKF5ConfigGui.so libKF5ConfigWidgets.so
  'kdbusaddons5' # libKF5DBusAddons.so
  'kwindowsystem5' # libKF5WindowSystem.so
  'kconfigwidgets5'
  'kio5' # libKF5KIOCore.so libKF5KIOGui.so
  'kxmlgui5' # libKF5XmlGui.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'hicolor-icon-theme'
)
makedepends=(
  'extra-cmake-modules'
  'kdoctools'
  'git'
  'python'
)
conflicts=('partitionmanager')
provides=('partitionmanager')
source=('git+https://invent.kde.org/system/partitionmanager.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd partitionmanager
  _ver="$(cat CMakeLists.txt | grep -m3 -e MAJOR -e MINOR -e RELEASE | cut -d '"' -f2 | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cmake -S partitionmanager -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
