# Merged with official ABS kgamma PKGBUILD by João, 2024/03/12 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kgamma-git
pkgver=6.6.80_r720.g57078d5
pkgrel=1
pkgdesc='Adjust your monitor gamma settings'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kcmutils-git kconfig-git kcoreaddons-git ki18n-git libx11 libxxf86vm qt6-base)
makedepends=(git extra-cmake-modules kdoctools-git)
conflicts=(${pkgname%-git} kgamma5 kgamma5-git)
provides=(${pkgname%-git})
replaces=(kgamma5-git)
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  git checkout master
}

build() {
  cmake -B build  -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
