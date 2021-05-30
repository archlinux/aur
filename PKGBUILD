# Merged with official ABS kde-cli-tools PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kde-cli-tools-git
pkgver=5.22.80_r1845.gddccf63
pkgrel=1
pkgdesc="Tools based on KDE Frameworks 5 to better interact with the system"
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(kdesu-git kcmutils-git kactivities-git)
makedepends=(git extra-cmake-modules-git kdoctools-git plasma-workspace-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('plasma-workspace-git: for kcmshell5')
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
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  ln -s /usr/lib/kf5/kdesu "$pkgdir"/usr/bin/
}
