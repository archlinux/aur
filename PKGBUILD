# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ktorrent-git
pkgver=25.07.70.r3459.7fb8eafc0
pkgrel=1
pkgdesc="A powerful BitTorrent client. (GIT version)"
arch=('x86_64')
url='https://apps.kde.org/ktorrent'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'libktorrent' 'libKTorrent6.so'
  'qt6-base' # libQt6Core.so libQt6DBus.so libQt6Gui.so libQt6Network.so  libQt6Widgets.so libQt6Xml.so
  'knotifyconfig' # libKF6NotifyConfig.so
  'kcmutils' # libKF6KCMUtils.so
  'kcompletion' # libKF6Completion.so
  'kconfig' #libKF6ConfigCore.so libKF6ConfigGui.so
  'kconfigwidgets' # libKF6ConfigWidgets.so
  'kcoreaddons' # libKF6CoreAddons.so
  'kcrash' # libKF6Crash.so
  'kdbusaddons' # libKF6DBusAddons.so
  'ki18n' # libKF6I18n.so
  'kiconthemes' # libKF6IconThemes.so
  'kio' # libKF6KIOCore.so libKF6KIOGui.so libKF6KIOWidgets.so
  'knotifications' # libKF6Notifications.so
  'kparts' # libKF6Parts.so
  'kwidgetsaddons' # libKF6WidgetsAddons.so
  'kwindowsystem' # libKF6WindowSystem.so
  'kxmlgui' # libKF6XmlGui
  'kstatusnotifieritem' # libKF6StatusNotifierItem.so
  'kglobalaccel' # libKF6GlobalAccel.so
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'extra-cmake-modules'
  'qt6-tools'
  'kdoctools'
  'python'
  'boost'
  'taglib'
  'libmaxminddb'
  'qt5-webengine'
  'phonon-qt6'
  'plasma-workspace'
  'kdnssd'
  'kplotting'
  'karchive'
  'syndication'
  'ktextwidgets'
)
optdepends=(
  'karchive: for ipfilter plugin'
  'ktextwidgets: for ipfilter plugin'
  'plasma-workspace: for shutdown plugin'
  'kplotting: for stats plugin'
  'libmaxminddb: for infowidget plugin'
  'kdnssd: for zeroconf plugin'
  'taglib: for mediaplayer plugin'
  'phonon-qt6: for multimedia plugin'
  'qt6-webengine: for search and RSS plugin'
  'syndication: for RSS plugin'
  'qt6-5compat: for RSS plugin'
)
checkdepends=('appstream')
provides=(
  'ktorrent'
  'libktcore.so'
)
conflicts=('ktorrent')
source=(
  'git+https://invent.kde.org/network/ktorrent.git'
  'https://invent.kde.org/network/ktorrent/-/merge_requests/57.diff'
)
sha256sums=(
  'SKIP'
  'SKIP'
)
options=('debug')

pkgver() {
  cd ktorrent
  _ver="$(cat CMakeLists.txt | grep -m3 -e RELEASE_SERVICE_VERSION_MAJOR -e RELEASE_SERVICE_VERSION_MINOR -e RELEASE_SERVICE_VERSION_MICRO | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d ktorrent -p1 -i "${srcdir}/57.diff"
}

build() {
  cmake -S ktorrent -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
