# Merged with official ABS pim-data-exporter PKGBUILD by João, 2021/07/19 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=pim-data-exporter-git
pkgver=24.04.40_r3095.g6bc10940
pkgrel=1
pkgdesc="Import and export KDE PIM settings"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL-2.0-or-later)
depends=(akonadi-mime-git akonadi-notes-git gcc-libs glibc karchive-git kcalendarcore-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kidentitymanagement-git kio-git kitemviews-git kmailtransport-git kmime-git kstatusnotifieritem-git ktextaddons-git kuserfeedback-git kwidgetsaddons-git kxmlgui-git libakonadi-git mailcommon-git pimcommon-git qt6-base)
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
