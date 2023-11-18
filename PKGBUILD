# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ktorrent-git
pkgver=24.01.75.r3140.f3c8bd1a
pkgrel=1
pkgdesc="A powerful BitTorrent client. (GIT version)"
arch=('x86_64')
url='https://apps.kde.org/ktorrent'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'libktorrent' 'libKF5Torrent.so'
  'qt5-base' # libQt5Core.so libQt5DBus.so libQt5Gui.so libQt5Network.so  libQt5Widgets.so libQt5Xml.so
  'knotifyconfig5' # libKF5NotifyConfig.so
  'kcmutils5' # libKF5KCMUtils.so
  'kcompletion5' # libKF5Completion.so
  'kconfig5' #libKF5ConfigCore.so libKF5ConfigGui.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kcrash5' # libKF5Crash.so
  'kdbusaddons5' # libKF5DBusAddons.so
  'ki18n5' # libKF5I18n.so
  'kiconthemes5' # libKF5IconThemes.so
  'kio5' # libKF5KIOCore.so libKF5KIOGui.so libKF5KIOWidgets.so
  'knotifications5' # libKF5Notifications.so
  'kparts5' # libKF5Parts.so
  'ktextwidgets5' # libKF5TextWidgets.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'kwindowsystem5' # libKF5WindowSystem.so
  'kxmlgui5' # libKF5XmlGui
  'syndication5' # ibKF5Syndication.so
  'karchive5' # libKF5Archive.so
)
makedepends=(
  'extra-cmake-modules'
  'kdoctools5'
  'git'
  'python'
  'boost'
  'taglib'
  'libmaxminddb'
  'qt5-webengine'
  'phonon-qt5'
  'plasma-workspace'
  'kdnssd5'
  'kplotting5'
)
optdepends=(
  'plasma-workspace: for shutdown plugin'
  'kplotting5: for stats plugin'
  'libmaxminddb: for infowidget plugin'
  'kdnssd5: for zeroconf plugin'
  'taglib: for mediaplayer plugin'
  'phonon-qt5: for multimedia plugin'
  'qt5-webengine: for search and RSS plugin'
)
checkdepends=('appstream')
provides=(
  'ktorrent'
  'libktcore.so'
)
conflicts=('ktorrent')
source=('git+https://invent.kde.org/network/ktorrent.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd ktorrent
  _ver="$(cat CMakeLists.txt | grep -m3 -e RELEASE_SERVICE_VERSION_MAJOR -e RELEASE_SERVICE_VERSION_MINOR -e RELEASE_SERVICE_VERSION_MICRO | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed 's|libmaxminddb|maxminddb|g' -i ktorrent/plugins/infowidget/CMakeLists.txt
}

build() {
  cmake -S ktorrent -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

#     -DBUILD_WITH_QT6=ON # NOTE: Qt6 port still unfinished

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
