# Merged with official ABS phonon PKGBUILD by João, 2021/05/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=phonon-git
pkgdesc="The multimedia framework by KDE"
pkgver=4.11.1_r3911.g0f0ae8d0
pkgrel=1
arch=($CARCH)
url='https://community.kde.org/Phonon'
license=(LGPL)
depends=(libpulse qt6-base)
optdepends=('pulseaudio: PulseAudio support' 'qt6-tools: Designer plugin')
makedepends=(git extra-cmake-modules-git qt6-tools qt6-5compat)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git}{,-qt6})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'project(Phonon VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
