# Merged with official ABS ksystemstats PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=ksystemstats-git
pkgver=6.0.80_r385.g8f19412
pkgrel=2
pkgdesc='A plugin based system monitoring daemon'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kcoreaddons-git ki18n-git kio-git libksysguard-git lm_sensors qt6-base solid-git)
makedepends=(git extra-cmake-modules-git libnl networkmanager-qt-git)
optdepends=('libnl: network usage monitor'
            'networkmanager-qt-git: network usage monitor'
            'systemd-libs: GPU monitor')
conflicts=(${pkgname%-git} 'ksysguard<5.21.90' 'ksysguard-git<5.21.90')
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
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
