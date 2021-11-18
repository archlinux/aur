# Merged with official ABS libkgapi PKGBUILD by João, 2021/11/18 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=libkgapi-git
pkgver=5.19.40_r1319.g7c286d7
pkgrel=1
pkgdesc='A KDE-based library for accessing various Google services via their public API'
url='https://www.kde.org/'
arch=($CARCH)
license=(GPL LGPL FDL)
depends=(kcalendarcore-git kcontacts-git kwallet-git)
makedepends=(git extra-cmake-modules-git qt5-tools)
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
