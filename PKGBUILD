# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-client-git
pkgver=0.3.0.r401.0eb9232
pkgrel=1
pkgdesc="Application to access Danbooru-based image boards. (GIT Version)"
arch=('x86_64')
url='http://www.dennogumi.org/projects/danbooru-client'
license=('GPL3')
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libc.so
  'kio5' # libKF5KIOCore.so libKF5KIOFileWidgets.so
  'kwallet5' # libKF5Wallet.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'kxmlgui5' # libKF5XmlGui.so
  'ktextwidgets5' # libKF5TextWidgets.so
  'kdeclarative5' # libKF5Declarative.so
  'ki18n5' # libKF5I18n.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kcompletion5' # libKF5Completion.so
  'kconfig5' # libKF5ConfigCore.so libKF5ConfigGui.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kfilemetadata5' # libKF5FileMetaData.so
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5Widgets.so
  'qt5-declarative' # libQt5Qml.so libQt5QuickWidgets.so
)
makedepends=(
  'extra-cmake-modules'
  'kdoctools5'
  'git'
  'python'
)
conflicts=('danbooru-client')
provides=('danbooru-client')
source=(
  'git+https://git.dennogumi.org/kde/danbooru-client.git'
  'https://github.com/lbeltrame/danbooru-client/raw/master/danbooru/img/logo.png'
)
sha256sums=(
  'SKIP'
  '395a907c61a3450e22a695f6d5e04bf3fbaf3342b02474ba401acbd595609b8b'
)

pkgver() {
  cd danbooru-client
  _ver="$(cat CMakeLists.txt | grep -m3 -e MAJOR -e MINOR -e PATCH | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed '/danbooruservice.h/d' -i danbooru-client/src/danbooruconnectwidget.cpp
}

build() {
  cmake -S danbooru-client -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/danbooru.png"
  sed 's|Icon=danbooru_client|Icon=danbooru|g' -i "${pkgdir}/usr/share/applications/"*.desktop
}
