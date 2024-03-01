# Merged with official ABS kpimtextedit PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kpimtextedit-git
pkgver=6.0.40_r2070.gdfe88e94
pkgrel=1
pkgdesc="A textedit with PIM-specific features"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kcodecs-git kcolorscheme-git kconfig-git kcoreaddons-git ki18n-git kio-git ktextaddons-git kwidgetsaddons-git kxmlgui-git qt6-base sonnet-git syntax-highlighting-git)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-tools)
groups=(kdepim-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
