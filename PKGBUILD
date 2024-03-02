# Merged with official ABS kget PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kget-git
pkgver=24.04.70_r3535.g543a65dc
pkgrel=1
pkgdesc='Download Manager'
url='https://apps.kde.org/kget/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc gpgme qgpgme-qt6 kcmutils-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kdbusaddons-git kiconthemes-git ki18n-git kio-git kitemviews-git knotifications-git knotifyconfig-git kstatusnotifieritem-git kwallet-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git qt6-base)
makedepends=(git boost extra-cmake-modules-git kdoctools-git libktorrent-git libmms)
arch=($CARCH)
groups=(kde-applications-git kde-network-git)
optdepends=('libktorrent-git: torrent support'
            'libmms: MMS support')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
