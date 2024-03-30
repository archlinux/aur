# Merged with official ABS phonon PKGBUILD by João, 2021/05/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=phonon-qt6-git
pkgdesc="The multimedia framework by KDE"
pkgver=4.12.0_r3961.g6febf7f0
pkgrel=1
arch=($CARCH)
url='https://community.kde.org/Phonon'
license=(LGPL)
depends=(libpulse qt6-base phonon-qt6-backend)
optdepends=('pulseaudio: PulseAudio support' 'qt6-tools: Designer plugin')
makedepends=(git extra-cmake-modules-git qt6-tools qt6-5compat qt5-base qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
replaces=(phonon-git)
source=("git+https://github.com/KDE/${pkgname%%-*}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%%-*}
  _ver="$(grep -m1 'project(Phonon VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%%-*} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
