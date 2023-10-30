# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=konversation-git
pkgver=1.9.231170.r9356.388f98e6a
pkgrel=1
pkgdesc="A user friendly IRC client for KDE. (GIT Version)"
arch=('x86_64')
url='https://kde.org/applications/en/internet/org.kde.konversation'
license=('GPL2' 'FDL')
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libc.so libm.so
  'karchive5' # libKF5Archive.so
  'kbookmarks5' # libKF5Bookmarks.so
  'kcodecs5' # libKF5Codecs.so
  'kcompletion5' # libKF5Completion.so
  'kconfig5' # libKF5ConfigCore.so libKF5ConfigGui.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kcrash5' # libKF5Crash.so
  'kdbusaddons5' # libKF5DBusAddons.so
  'kglobalaccel5' # libKF5GlobalAccel.so
  'ki18n5' # libKF5I18n.so
  'kidletime5' # libKF5IdleTime.so
  'kio5' # libKF5KIOCore.so libKF5KIOFileWidgets.so libKF5KIOGui.so libKF5KIOWidgets.so
  'kitemviews5' # libKF5ItemViews.so
  'knewstuff5' # libKF5NewStuffWidgets.so
  'knotifications5' # libKF5Notifications.so
  'knotifyconfig5' # libKF5NotifyConfig.so
  'kparts5' # libKF5Parts.so
  'kservice5' # libKF5Service.so
  'ktextwidgets5' # libKF5TextWidgets.so
  'kwallet5' # libKF5Wallet.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'kwindowsystem5' # libKF5WindowSystem.so
  'kxmlgui5' # libKF5XmlGui.so
  'qca-qt5' # libqca-qt5.so
  'qt5-base' # libQt5Core.so libQt5DBus.so libQt5Gui.so libQt5Network.so libQt5Widgets.so libQt5Xml.so
  'qt5-multimedia' # libQt5Multimedia.so
  'bash'
  'perl'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'extra-cmake-modules'
  'qt5-tools'
  'kdoctools'
  'python'
)
optdepends=('python: python scripting support')
checkdepends=('appstream')
conflicts=('konversation')
provides=('konversation')
source=('git+https://invent.kde.org/network/konversation.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd konversation
  _ver="$(cat CMakeLists.txt | grep "set(KONVERSATION_BASE_VERSION" | cut -d '"' -f2)"
  _vermaj="$(cat CMakeLists.txt | grep "RELEASE_SERVICE_VERSION_MAJOR" -m1 | cut -d '"' -f2)"
  _vermin="$(cat CMakeLists.txt | grep "RELEASE_SERVICE_VERSION_MINOR" -m1 | cut -d '"' -f2)"
  _vermic="$(cat CMakeLists.txt | grep "RELEASE_SERVICE_VERSION_MICRO" -m1 | cut -d '"' -f2)"
  echo "${_ver}.${_vermaj}${_vermin}${_vermic}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cmake -S konversation -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
