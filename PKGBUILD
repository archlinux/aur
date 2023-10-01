# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jimmy Bergstrom <thekwarf@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=kwooty-frameworks-git
pkgver=1.1.0.r1228.4def039
pkgrel=1
pkgdesc="A friendly nzb usenet binary downloader for KDE. KF5 frameworks branch. (GIT Version)"
arch=('x86_64')
url='http://kwooty.sourceforge.net'
license=('GPL')
depends=(
  'gcc-libs' # 'libstdc++.so'
  'glibc' # 'libc.so'
  'qt5-base' # 'libQt5Core.so' 'libQt5DBus.so' 'libQt5Gui.so' 'libQt5Network.so' 'libQt5Widgets.so'
  'kdelibs4support' # 'libKF5KDELibs4Support.so'
  'kcmutils5' # 'libKF5KCMUtils.so'
  'kconfig5' # 'libKF5ConfigCore.so' 'libKF5ConfigGui.so'
  'kconfigwidgets5' # 'libKF5ConfigWidgets.so'
  'kcoreaddons5' # 'libKF5CoreAddons.so'
  'kguiaddons5' # 'libKF5GuiAddons.so'
  'ki18n5' # 'libKF5I18n.so'
  'kiconthemes5' # 'libKF5IconThemes.so'
  'kio5' # 'libKF5KIOCore.so' 'libKF5KIOWidgets.so'
  'knotifications5' # 'libKF5Notifications.so'
  'kservice5' # 'libKF5Service.so'
  'kwallet5' # 'libKF5Wallet.so'
  'kwidgetsaddons5' # 'libKF5WidgetsAddons.so'
  'kwindowsystem5' # 'libKF5WindowSystem.so'
  'kxmlgui5' # 'libKF5XmlGui.so'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'cmake'
  'extra-cmake-modules'
  'kdoctools'
)
optdepends=(
  'unrar: automatic RAR-archive extraction'
  'p7zip: automatic zip and 7z archive extraction'
  'par2cmdline: automatic file repairing'
)
provides=(
  'kwooty'
  'libkwootycore.so'
)
conflicts=('kwooty')
source=(
  'git+https://invent.kde.org/network/kwooty.git#branch=frameworks'
  'q_namespace.patch'
)
sha256sums=(
  'SKIP'
  'd7bc520fa960e831e24f56c15b2c45afec5d5c4ec4fb1a584d1cbcfca7c6d885'
)
options=('debug')

pkgver() {
  cd kwooty
  _ver=$(cat src/main.cpp | grep 'ki18n("Kwooty"),' | cut -d '"' -f4)
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d kwooty -p1 -i "${srcdir}/q_namespace.patch"
}

build() {
  cmake -S kwooty -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
