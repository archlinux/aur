# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kscd-git
pkgver=17.08.3.24.gaf73a1c
pkgrel=1
pkgdesc="KDE CD player. (GIT version)"
arch=('x86_64')
url='https://kde.org/applications/en/unmaintained/org.kde.kscd'
license=('GPL2')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'qt5-base' # libQt5Core.so libQt5DBus.so libQt5Gui.so libQt5Widgets.so
  'qt5-svg' # libQt5Svg.so
  'kconfig5' # libKF5ConfigCore.so libKF5ConfigGui.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kdbusaddons5' # libKF5DBusAddons.so
  'ki18n5' # libKF5I18n.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'phonon-qt5' # libphonon4qt5.so
  'solid5' # libKF5Solid.so
  'kxmlgui5' # libKF5XmlGui.so
  'libdiscid' # libdiscid.so
  'libmusicbrainz5' 'libmusicbrainz5.so'
  'hicolor-icon-theme'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'qt5-tools'
  'python'
)
checkdepends=('appstream')
conflicts=(
  'kdemultimedia-kscd'
  'kscd'
)
provides=('kscd')
source=(
  'git+https://invent.kde.org/multimedia/kscd.git#branch=kf5'
  'qurl.patch'
  'kscd.kcfg.patch'
  'kscd.cpp.patch'
)
sha256sums=(
  'SKIP'
  'd1c8a39c0e7a45b71224a167064c14d7f204102197d879a0a0f2aa25c17eaa88'
  'b9646957cf85c8f08930c38a353f22246332b35bde5914b32ae1d3a20eb1302e'
  'ed6024197b4775895dc8f8c8ee55a69e4463eaccc18a44b5e65cd0d4ccde2c92'
)

pkgver(){
  cd kscd
#   _ver="$(cat CMakeLists.txt | grep -m3 -e MAJOR -e MINOR -e RELEASE | cut -d '"' -f2 | paste -sd'.')"
#   echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare(){
  patch -d kscd -p1 -i "${srcdir}/qurl.patch"
  patch -d kscd -p1 -i "${srcdir}/kscd.kcfg.patch"
  patch -d kscd -p1 -i "${srcdir}/kscd.cpp.patch"
}

build(){
  cmake -S kscd -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=ON

  LC_ALL=C cmake --build build
}

check(){
  ctest --test-dir build --output-on-failure
}

package(){
  DESTDIR="${pkgdir}" cmake --install build
}
