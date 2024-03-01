# Merged with official ABS akonadi-calendar PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=akonadi-calendar-git
pkgver=6.0.40_r2655.g78fbfea3
pkgrel=1
pkgdesc="Akonadi calendar integration"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL-2.0-or-later)
depends=(akonadi-contacts-git akonadi-mime-git gcc-libs glibc gpgme kcalendarcore-git kcalutils-git kcodecs-git kconfig-git kcontacts-git kcoreaddons-git kdbusaddons-git ki18n-git kidentitymanagement-git kio-git kitemmodels-git kmailtransport-git kmime-git knotifications-git kservice-git kwidgetsaddons-git kxmlgui-git libakonadi-git libkleo-git messagelib-git qgpgme-qt6 qt6-base)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 -e 'set(RELEASE_SERVICE_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  _ver=${_ver:-"$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"}
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
