# Merged with official ABS kdesu PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdesu-git
pkgver=5.83.0_r462.g8a2c65c
pkgrel=1
pkgdesc='Integration with su for elevated privileges'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kservice-git kpty-git)
makedepends=(git extra-cmake-modules-git doxygen qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf5-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF5\?_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

# See FS#44277
  chown :nobody "$pkgdir"/usr/lib/kf5/kdesud
  chmod g+s "$pkgdir"/usr/lib/kf5/kdesud
}
