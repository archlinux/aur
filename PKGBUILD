# Merged with official ABS kidentitymanagement PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Golatofsk <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kidentitymanagement-git
pkgver=6.0.40_r4290.ga7d34838
pkgrel=2
pkgdesc="KDE PIM libraries"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kcodecs-git kcompletion-git kconfig-git kcoreaddons-git ki18n-git kio-git kpimtextedit-git ktextaddons-git kwidgetsaddons-git kxmlgui-git qt6-base)
makedepends=(git doxygen extra-cmake-modules-git kirigami-addons-git qt6-doc qt6-tools)
groups=(kdepim-git)
optdepends=('kirigami-addons-git: QML bindings'
            'qt6-declarative: QML bindings')
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
