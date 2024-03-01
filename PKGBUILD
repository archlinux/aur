# Merged with official ABS ksystemlog PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ksystemlog-git
pkgver=24.04.70_r975.g68a32a5
pkgrel=1
pkgdesc='System log viewer tool'
url='https://kde.org/applications/system/ksystemlog/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(audit gcc-libs glibc karchive-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git ki18n-git kio-git kitemviews-git ktextwidgets-git kwidgetsaddons-git kxmlgui-git qt6-5compat qt6-base systemd-libs)
makedepends=(git extra-cmake-modules-git kdoctools-git)
arch=($CARCH)
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
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
