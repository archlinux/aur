# Merged with official ABS kde-cli-tools PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kde-cli-tools-git
pkgver=6.0.80_r2321.g69ab7c2f
pkgrel=2
pkgdesc="Tools based on KDE Frameworks 5 to better interact with the system"
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kcmutils-git kcompletion-git kconfig-git kcoreaddons-git kdesu-git ki18n-git kiconthemes-git kio-git kparts-git kservice-git kwidgetsaddons-git kwindowsystem-git qt6-base qt6-svg sh)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  ln -s /usr/lib/kf6/kdesu-git "$pkgdir"/usr/bin/
}
