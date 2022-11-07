# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=punes-git
pkgver=0.109.r1896.45a55f4d
pkgrel=1
pkgdesc="Nintendo Entertainment System emulator (git build)"
arch=('x86_64')
url="https://github.com/punesemu/puNES"
license=('GPL2')
depends=('alsa-lib' 'desktop-file-utils' 'ffmpeg' 'hicolor-icon-theme' 'nvidia-cg-toolkit' 'libxrandr' 'qt5-base' 'qt5-svg')
makedepends=('cmake' 'git' 'glu' 'ninja' 'qt5-tools' 'qt5-wayland')
conflicts=('punes')
provides=('punes')
source=("punes::git+https://github.com/punesemu/puNES.git")
md5sums=('SKIP')

#breaks internal lib7zip
options=('!buildflags')

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
    -DENABLE_QT6_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
