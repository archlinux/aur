# Merged with official ABS kwin PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kwin-git
pkgver=5.22.80_r19461.geb27d312a
pkgrel=1
pkgdesc='An easy to use, but flexible, composited Window Manager'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(kscreenlocker-git xcb-util-cursor plasma-framework-git kcmutils-git kwayland-server-git breeze-git qt5-sensors qt5-script pipewire libqaccessibilityclient-git libdrm lcms2)
makedepends=(git extra-cmake-modules-git qt5-tools kdoctools-git krunner-git xorg-xwayland)
optdepends=('qt5-virtualkeyboard: virtual keyboard support for kwin-wayland'
            'maliit-keyboard: virtual keyboard support for kwin-wayland')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
install=${pkgname%-git}.install
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
