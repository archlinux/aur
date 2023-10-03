# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kaudiocreator-git
pkgver=1.3.r886.f21c160
pkgrel=1
pkgdesc="A program for ripping and encoding Audio-CDs, encoding files from disk. (GIT version)"
arch=('x86_64')
url='https://kde.org/applications/en/unmaintained/org.kde.kaudiocreator'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so
  'glibc' # libstdc++.so libc.so
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5Network.so libQt5Widgets.so
  'bash'
  'taglib' # libtag.so
  'libmusicbrainz5' 'libmusicbrainz5.so'
  'libdiscid' # libdiscid.so
  'kcodecs5' # libKF5Codecs.so
  'kcompletion5' # libKF5Completion.so
  'knotifyconfig5' # libKF5NotifyConfig.so
  'ktextwidgets5' # libKF5TextWidgets.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kconfig5' # libKF5ConfigCore.so libKF5ConfigGui.so
  'kcmutils5' # libKF5KCMUtils.so
  'phonon-qt5' # libphonon4qt5.so
  'kxmlgui5' # libKF5XmlGui.so
  'libkcompactdisc' # libKF5CompactDisc.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kio5' # libKF5KIOCore.so libKF5KIOWidgets.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'knotifications5' # libKF5Notifications.so
  'ki18n5' # libKF5I18n.so
  'solid5' # libKF5Solid.so
  'kservice5' # libKF5Service.so
  'kdelibs4support' # libKF5KDELibs4Support.so
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'extra-cmake-modules'
  'kdoctools5'
  'doxygen'
  'python'
)
conflicts=('kaudiocreator')
provides=('kaudiocreator')
source=(
  'git+https://invent.kde.org/unmaintained/kaudiocreator.git'
  'git+https://invent.kde.org/multimedia/libkcddb.git#branch=release/20.04')
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd kaudiocreator
  _ver="$(cat main.cpp | grep -m1 KAudioCreator | cut -d '"' -f6)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e 's|SHARED|STATIC|g' \
      -e 's|PRIVATE musicbrainz|&5|g' \
      -i libkcddb/libkcddb/CMakeLists.txt

  sed -e 's|TAGLIB_INCLUDE_DIR|Taglib_INCLUDE_DIRS|g' \
      -e 's|TAGLIB|Taglib|g' \
      -i kaudiocreator/CMakeLists.txt
}

build() {
  cmake -S libkcddb -B build-libkcddb \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX="${srcdir}/fakeroot/usr" \
    -DBUILD_TESTING=OFF

  cmake --build build-libkcddb
  cmake --install build-libkcddb

  cmake -S kaudiocreator -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON \
    -DKF5Cddb_DIR="${srcdir}/fakeroot/usr/lib/cmake/KF5Cddb"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
