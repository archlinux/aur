# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: A Rojas < nqn1976 @ gmail.com >

pkgname=partitionmanager-git
pkgver=24.04.70.r1949.6c37f067
pkgrel=1
pkgdesc="A KDE utility that allows you to manage disks, partitions, and file systems. (GIT version)"
arch=('x86_64')
url='https://kde.org/applications/en/system/org.kde.partitionmanager'
license=('GPL2')
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libc.so
  'kpmcore' 'libkpmcore.so'
  'qt6-base' # libQt5Core.so libQt5Gui.so libQt5Widgets.so
  'polkit-qt6' #libpolkit-qt5-core-1.so
  'ki18n' # libKF6I18n.so
  'kcrash' # libKF6Crash.so
  'kjobwidgets' # libKF6JobWidgets.so
  'kconfig' # libKF6ConfigCore.so libKF6ConfigGui.so libKF6ConfigWidgets.so
  'kdbusaddons' # libKF6DBusAddons.so
  'kwindowsystem' # libKF6WindowSystem.so
  'kconfigwidgets' # libKF6ConfigWidgets.so.6
  'kio' # libKF6KIOCore.so libKF6KIOGui.so
  'kxmlgui' # libKF6XmlGui.so
  'kcoreaddons' # libKF6CoreAddons.so
  'kwidgetsaddons' # libKF6WidgetsAddons.so
  'kcolorscheme' # libKF6ColorScheme.so.6
  'hicolor-icon-theme'
)
makedepends=(
  'extra-cmake-modules'
  'kdoctools'
  'git'
  'python'
)
checkdepends=('appstream')
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
