# Merged with official ABS pim-sieve-editor PKGBUILD by João, 2021/07/19 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=pim-sieve-editor-git
pkgver=24.04.40_r1971.g6f6b2b9
pkgrel=1
pkgdesc="Mail sieve editor"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc kbookmarks-git kcolorscheme-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kmailtransport-git kuserfeedback-git kwidgetsaddons-git kxmlgui-git libksieve-git pimcommon-git qt6-base qtkeychain-qt6)
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
