# Merged with official ABS pulseaudio-qt PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

basepkgname=pulseaudio-qt-git
pkgname=pulseaudio-qt6-git
pkgver=1.3.0_r756.gda98bd2
pkgrel=1
pkgdesc='Qt bindings for libpulse'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt6-base libpulse)
makedepends=(git extra-cmake-modules doxygen qt6-tools qt6-doc)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://invent.kde.org/libraries/${basepkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${basepkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d ' ' -f2 | tr -d ')' | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${basepkgname%-git} \
    -DBUILD_QCH=ON \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/opt/KF5-qt6/ \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
