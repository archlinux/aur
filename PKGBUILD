# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=krename-git
pkgver=5.0.60.r778.17aacf9
pkgrel=1
pkgdesc="A very powerful batch file renamer for KDE. (GIT Version)"
arch=('x86_64')
url='https://kde.org/applications/en/utilities/org.kde.krename'
license=('GPL')
depends=(
  'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
  'glibc' # 'libc.so'
  'karchive5' # 'libKF5Archive.so'
  'kcompletion5' # 'libKF5Completion.so'
  'kconfig5' # 'libKF5ConfigCore.so'
  'kcoreaddons5' # 'libKF5CoreAddons.so'
  'kcrash5' # 'libKF5Crash.so'
  'ki18n5' # 'libKF5I18n.so'
  'kio5' # 'libKF5KIOCore.so' 'libKF5KIOFileWidgets.so' 'libKF5KIOWidgets.so'
  'kitemviews5' # 'libKF5ItemViews.so'
  'kjobwidgets5' # 'libKF5JobWidgets.so'
  'kservice5' # 'libKF5Service.so'
  'kwidgetsaddons5' # 'libKF5WidgetsAddons.so'
  'kxmlgui5' # 'libKF5XmlGui.so'
  'exiv2' 'libexiv2.so'
  'freetype2' 'libfreetype.so'
  'podofo' 'libpodofo.so'
  'qt5-base' # 'libQt5Core.so' 'libQt5Gui.so' 'libQt5Widgets.so' 'libQt5Xml.so'
  'qt5-declarative' # 'libQt5Qml.so'
  'taglib' # 'libtag.so'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'extra-cmake-modules'
  'python'
  'kdoctools5'
)
checkdepends=('appstream')
provides=('krename')
conflicts=('krename')
source=('git+https://invent.kde.org/utilities/krename.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd krename
  _ver="$(cat CMakeLists.txt | grep -m1 'krename VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cmake -S krename -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
