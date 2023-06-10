# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=layer-shell-qt-git
pkgver=5.27.80_r94.g3bfed84
pkgrel=1
pkgdesc='Qt component to allow applications to make use of the Wayland wl-layer-shell protocol'
arch=($CARCH)
url='https://invent.kde.org/plasma/layer-shell-qt'
license=(LGPL)
depends=(qt6-wayland)
makedepends=(git extra-cmake-modules-git wayland-protocols)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 "set(PROJECT_VERSION" CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
