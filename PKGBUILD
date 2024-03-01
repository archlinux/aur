# Merged with official ABS khelpcenter PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=khelpcenter-git
pkgver=24.04.70_r3058.g122c8296
pkgrel=1
pkgdesc="Application to show KDE Applications' documentation"
arch=($CARCH)
url='https://userbase.kde.org/KHelpCenter'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc karchive-git kbookmarks-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kdbusaddons-git kdoctools-git ki18n-git kio-git kservice-git ktexttemplate-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git libxml2 perl qt6-base qt6-webengine xapian-core)
makedepends=(git extra-cmake-modules-git)
groups=(kde-applications-git kde-system-git)
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
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
