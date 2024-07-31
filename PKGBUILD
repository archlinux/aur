# Merged with official ABS phonon PKGBUILD by João, 2021/05/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=phonon-qt5-git
pkgdesc="The multimedia framework by KDE"
pkgver=4.12.0_r3982.g0bb5869c
pkgrel=1
arch=($CARCH)
url='https://community.kde.org/Phonon'
license=(LGPL)
depends=(gcc-libs glibc libpulse qt5-base phonon-qt5-backend)
optdepends=('pulseaudio: PulseAudio support' 'qt5-tools: Designer plugin')
makedepends=(git extra-cmake-modules qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%%-*}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%%-*}
  _ver="$(grep -im1 "project(${pkgname%%-*} VERSION" CMakeLists.txt | sed 's/.* //; s/-/./g; s/)//; s/\"//g')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%%-*} \
    -DQT_MAJOR_VERSION=5 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
