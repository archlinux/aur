# Merged with official ABS kdelibs4support PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdelibs4support-git
pkgver=5.113.0_r1261.gec297bf3
pkgrel=1
pkgdesc='Porting aid from KDELibs4'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kunitconversion5 kitemmodels5 kemoticons kparts5 perl)
makedepends=(git extra-cmake-modules kdoctools5 qt5-tools networkmanager perl-uri kdesignerplugin)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf5-aids-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git#branch=kf5")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF5\?_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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

# cert bundle seems to be hardcoded
# link it to the one from ca-certificates
  rm -f "$pkgdir"/usr/share/kf5/kssl/ca-bundle.crt
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir"/usr/share/kf5/kssl/ca-bundle.crt
}
