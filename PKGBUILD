# Merged with official ABS kdepim-runtime PKGBUILD by João, 2021/07/19 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kdepim-runtime-git
pkgver=24.04.40_r16549.g8512a98d6
pkgrel=1
pkgdesc='Extends the functionality of kdepim'
arch=($CARCH)
url='https://kontact.kde.org'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(akonadi-git akonadi-calendar-git akonadi-contacts-git akonadi-mime-git akonadi-notes-git gcc-libs glibc kcalendarcore-git kcmutils-git kcodecs-git kcompletion-git kconfig-git kconfigwidgets-git kcontacts-git kcoreaddons-git kdav-git ki18n-git kidentitymanagement-git kimap-git kio-git kjobwidgets-git kldap-git kmailtransport-git kmime-git kmbox-git knotifications-git knotifyconfig-git kservice-git ktextaddons-git ktextwidgets-git kwallet-git kwidgetsaddons-git kwindowsystem-git libakonadi-git libkgapi-git libkolabxml libsasl qca-qt6-git qt6-base qt6-networkauth qt6-speech qt6-webengine qtkeychain-qt6)
makedepends=(git boost extra-cmake-modules-git kdoctools-git)
optdepends=('libetebase: EteSync resource')
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
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
