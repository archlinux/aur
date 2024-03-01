# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kio-admin-git
pkgver=${RELEASE_SERVICE_VERSION}_r235.g1931921
pkgrel=1
pkgdesc='Manage files as administrator using the admin:// KIO protocol.'
arch=($CARCH)
url="https://github.com/KDE/${pkgname%-git}"
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc kcoreaddons-git ki18n-git kio-git polkit-qt6-git qt6-base)
makedepends=(git extra-cmake-modules-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 "project(${pkgname%-git} VERSION" CMakeLists.txt | cut -d ' ' -f3 | tr - .)"
  echo "${_ver/)/}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
