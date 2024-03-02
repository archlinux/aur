# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ktextaddons-git
pkgver=1.5.45_r1256.g3936a38
pkgrel=3
pkgdesc="KDE text addons"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL)
depends=(gcc-libs glibc karchive-git kcolorscheme-git kconfig-git kconfigwidgets-git ki18n-git kio-git kwidgetsaddons-git qt6-base qt6-speech qtkeychain-qt6 sonnet-git syntax-highlighting-git)
makedepends=(git doxygen extra-cmake-modules-git ktextaddons-git kxmlgui-git qt6-tools)
groups=(kdepim-git)
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
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF \
    -DBUILD_DESIGNERPLUGIN=ON \
    -DBUILD_QCH=ON \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
