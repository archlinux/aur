# Merged with official ABS calendarsupport PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=calendarsupport-git
pkgver=6.0.40_r1022.g5064a67
pkgrel=1
pkgdesc="Calendar support library"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL-2.0-or-later)
depends=(akonadi-calendar-git akonadi-notes-git gcc-libs glibc kcalendarcore-git kcalutils-git kcodecs-git kconfig-git kcoreaddons-git kguiaddons-git kholidays-git ki18n-git kidentitymanagement-git kio-git kmime-git kservice-git ktextaddons-git kwidgetsaddons-git libakonadi-git qt6-base)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(RELEASE_SERVICE_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
