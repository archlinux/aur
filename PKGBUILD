# Merged with official ABS polkit-kde-agent PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=polkit-kde-agent-git
pkgver=6.0.80_r693.g010d42d
pkgrel=1
pkgdesc='Daemon providing a polkit authentication UI for KDE'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kirigami-git kwindowsystem-git polkit-qt6-git qt6-5compat qt6-base qt6-declarative)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git} polkit-kde-git)
provides=(${pkgname%-git})
replaces=(polkit-kde-git)
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}-1.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}-1
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git}-1 \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
