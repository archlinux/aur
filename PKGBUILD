# Merged with official ABS libksieve PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=libksieve-git
pkgver=6.0.40_r2255.g78e52c24
pkgrel=1
pkgdesc="KDE PIM library for managing sieves"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git ki18n-git kiconthemes-git kidentitymanagement-git kio-git kmime-git ktextaddons-git kwidgetsaddons-git libkdepim-git libsasl pimcommon-git qt6-base qt6-webengine sonnet-git syntax-highlighting-git)
makedepends=(git doxygen extra-cmake-modules-git kdoctools-git kmailtransport-git qt6-doc qt6-tools)
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
