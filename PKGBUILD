# Merged with official ABS kcalendarcore PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=kcalendarcore-git
pkgver=6.0.0_r1414.ga65a2d114
pkgrel=1
pkgdesc="The KDE calendar access library"
arch=($CARCH)
url="https://community.kde.org/Frameworks"
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs glibc libical qt6-base)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-tools)
conflicts=(${pkgname%-git} kcalcore{,-git})
provides=(${pkgname%-git} kcalcore{,git})
replaces=(kcalcore-git)
groups=(kf6-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF5\?_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
