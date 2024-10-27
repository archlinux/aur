# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=krename-git
pkgver=5.0.60.r863.00fc8b0
pkgrel=1
pkgdesc="A very powerful batch file renamer for KDE. (GIT Version)"
arch=('x86_64')
url='https://apps.kde.org/krename'
license=(
  'BSD-3-Clause'
  'CC0-1.0'
  'GPL-2.0-only'
  'GPL-2.0-or-later'
)
depends=(
  'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
  'glibc' # 'libc.so'
  'karchive' # 'libKF6Archive.so'
  'kcompletion' # 'libKF6Completion.so'
  'kconfig' # 'libKF6ConfigCore.so'
  'kcoreaddons' # 'libKF6CoreAddons.so'
  'kcrash' # 'libKF6Crash.so'
  'ki18n' # 'libKF6I18n.so'
  'kio' # 'libKF6KIOWidgets.so' 'libKF6KIOGui.so', 'libKF6KIOCore.so' 'libKF6KIOFileWidgets.so'
  'kitemviews' # 'libKF6ItemViews.so'
  'kwidgetsaddons' # 'libKF6WidgetsAddons.so'
  'kxmlgui' # 'libKF6XmlGui.so'
  'exiv2' 'libexiv2.so'
  'freetype2' 'libfreetype.so'
  'podofo' 'libpodofo.so'
  'qt6-base' # 'libQt6Core.so' 'libQt6Gui.so' 'libQt6Widgets.so' 'libQt6Xml.so'
  'qt6-declarative' # 'libQt5Qml.so'
  'qt6-5compat' # 'libQt6Core5Compat.so'
  'taglib' # 'libtag.so'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'extra-cmake-modules'
  'python'
  'kdoctools'
)
checkdepends=('appstream')
provides=('krename')
conflicts=('krename')
source=(
  'git+https://invent.kde.org/utilities/krename.git'
)
sha256sums=(
  'SKIP'
)
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
    -DBUILD_TESTING=ON \
    -DBUILD_WITH_QT6=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 krename/LICENSES/BSD-3-Clause.txt "${pkgdir}/usr/share/licenses/${pkgname}/BSD-3-Clause.txt"
}
