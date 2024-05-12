# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=konversation-git
pkgver=1.10.240770.r9556.e78b0ae1f
pkgrel=1
pkgdesc='A user friendly IRC client for KDE. (GIT Version)'
arch=('x86_64')
url='https://apps.kde.org/konversation'
license=('GPL2' 'FDL')
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libc.so libm.so
  'karchive' # libKF6Archive.so
  'kbookmarks' # libKF6Bookmarks.so
  'kcodecs' # libKF6Codecs.so
  'kcompletion' # libKF6Completion.so
  'kconfig' # libKF6ConfigCore.so libKF6ConfigGui.so
  'kconfigwidgets' # libKF6ConfigWidgets.so
  'kcoreaddons' # libKF6CoreAddons.so
  'kcrash' # libKF6Crash.so
  'kdbusaddons' # libKF6DBusAddons.so
  'kglobalaccel' # libKF6GlobalAccel.so
  'ki18n' # libKF6I18n.so
  'kidletime' # libKF6IdleTime.so
  'kio' # libKF6KIOCore.so libKF6KIOFileWidgets.so libKF6KIOGui.so libKF6KIOWidgets.so
  'kitemviews' # libKF6ItemViews.so
  'knewstuff' # libKF6NewStuffWidgets.so
  'knotifications' # libKF6Notifications.so
  'knotifyconfig' # libKF6NotifyConfig.so
  'kparts' # libKF6Parts.so
  'ktextwidgets' # libKF6TextWidgets.so
  'kwallet' # libKF6Wallet.so
  'kwidgetsaddons' # libKF6WidgetsAddons.so
  'kwindowsystem' # libKF6WindowSystem.so
  'kxmlgui' # libKF6XmlGui.so
  'kstatusnotifieritem' # libKF6StatusNotifierItem.so
  'kcolorscheme' # libKF6ColorScheme.so
  'qca-qt6' # libqca-qt6.so
  'qt6-base' # libQt6Core.so libQt6DBus.so libQt6Gui.so libQt6Network.so libQt6Widgets.so libQt6Xml.so
  'qt6-multimedia' # libQt6Multimedia.so
  'qt6-5compat' # libQt6Core5Compat.so
  'bash'
  'perl'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'extra-cmake-modules'
  'qt6-tools'
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
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
