# Merged with official ABS ktextaddons PKGBUILD by João, 2026/05/04 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ktextaddons-git
pkgver=2.0.56_r5836.gb957221cb
pkgrel=1
pkgdesc='Various text handling addons'
arch=($CARCH)
license=(GPL)
url='https://invent.kde.org/libraries/ktextaddons-git'
depends=(gcc-libs glibc karchive-git kcolorscheme-git kconfig-git kconfigwidgets-git ki18n-git kio-git kwidgetsaddons-git qt6-base qt6-speech qtkeychain-qt6 sonnet-git syntax-highlighting-git)
makedepends=(git doxygen extra-cmake-modules-git karchive-git kconfig-git kconfigwidgets-git ki18n-git kio-git ktextaddons-git kwidgetsaddons-git kxmlgui-git qt6-base qt6-doc qt6-speech qt6-tools qtkeychain-qt6 sonnet-git syntax-highlighting-git)
optdepends=('languagetool: Grammar checking'
            'grammalecte: French grammar checking'
            'libreoffice: Use autocorrection data from LibreOffice')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KTEXTADDONS_CURRENT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_DESIGNERPLUGIN=ON \
    -DBUILD_QCH=ON \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

