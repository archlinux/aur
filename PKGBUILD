# Merged with official ABS akonadi-import-wizard PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=akonadi-import-wizard-git
pkgver=24.04.40_r2088.g00bde84
pkgrel=1
pkgdesc="Import data from other mail clients to KMail"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc kconfig-git kcontacts-git kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kidentitymanagement-git kmailtransport-git kwidgetsaddons-git kxmlgui-git libakonadi-git mailcommon-git mailimporter-git messagelib-git pimcommon-git qt6-base qtkeychain-qt6)
makedepends=(git extra-cmake-modules-git kdoctools-git)
optdepends=('kdepim-addons-git: additional import plugins')
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
