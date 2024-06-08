# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=punes-git
pkgver=0.111.r2299.6e51b1a6
pkgrel=1
pkgdesc="Nintendo Entertainment System emulator (git build)"
arch=('x86_64')
url="https://github.com/punesemu/puNES"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'ffmpeg' 'hicolor-icon-theme' 'nvidia-cg-toolkit' 'libxrandr' 'qt6-base' 'qt6-svg'
         'gcc-libs' 'glibc' 'libglvnd' 'libx11' 'libudev.so')
makedepends=('cmake' 'git' 'glu' 'ninja' 'qt6-tools')
conflicts=('punes')
provides=('punes')
source=("punes::git+https://github.com/punesemu/puNES.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags | sed 's/v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "${pkgname%-git}" \
    -G Ninja \
    -B build \
    -DENABLE_GIT_INFO=ON \
    -DENABLE_OPENGL_CG=ON \
    -DENABLE_QT6_LIBS=ON \
    -DDISABLE_PORTABLE_MODE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
