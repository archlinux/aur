# Merged with official ABS kaddressbook PKGBUILD by João, 2021/07/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kaddressbook-git
pkgver=24.04.40_r6662.g8a848679
pkgrel=1
pkgdesc="KDE contact manager"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL-2.0-or-later)
depends=(akonadi-contacts-git akonadi-search-git gcc-libs glibc grantleetheme-git kcmutils-git kcolorscheme-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kcrash-git kdepim-runtime-git ki18n-git kitemmodels-git kontactinterface-git kparts-git kuserfeedback-git kwidgetsaddons-git kxmlgui-git libakonadi-git libkdepim-git pimcommon-git qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kdepim-git)
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
