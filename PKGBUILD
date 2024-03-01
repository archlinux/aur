# Merged with official ABS kio-fuse PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kio-fuse-git
pkgver=5.1.0_r240.g7266283
pkgrel=1
arch=($CARCH)
pkgdesc="FUSE interface for KIO"
url="https://kde.org/"
license=(GPL)
depends=(fuse3 gcc-libs glibc kcoreaddons-git kio-git qt6-base)
makedepends=(git extra-cmake-modules-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
# _ver="$(grep -m1 'project(kio-fuse VERSION' CMakeLists.txt | cut -d ' ' -f3 | tr -d ')' | tr - .)"
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
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
