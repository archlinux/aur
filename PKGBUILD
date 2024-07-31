# Merged with official ABS phonon PKGBUILD by João, 2021/05/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=phonon-qt6-git
pkgdesc="The multimedia framework by KDE"
pkgver=4.12.0_r3982.g0bb5869c
pkgrel=1
arch=($CARCH)
url='https://community.kde.org/Phonon'
license=(LGPL)
depends=(gcc-libs glibc libpulse qt6-base qt6-tools qt5-base qt5-tools)
optdepends=('pulseaudio: PulseAudio support' 'qt6-tools: Designer plugin')
makedepends=(git extra-cmake-modules qt6-tools qt6-5compat)
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
