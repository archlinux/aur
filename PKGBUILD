# Merged with official ABS kldap PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kldap-git
pkgver=6.0.40_r1245.g6d27c15
pkgrel=1
pkgdesc="LDAP access API for KDE"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kconfig-git kcoreaddons-git ki18n-git kio-git kwidgetsaddons-git libldap libsasl qt6-base qtkeychain-qt6)
makedepends=(git doxygen extra-cmake-modules-git kdoctools-git qt6-doc qt6-tools)
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
