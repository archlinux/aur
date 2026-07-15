# Maintainer: Your Name <your-email@domain.com>
pkgname=raylib-wayland-git
_pkgname=raylib
pkgver=6.0.r225.g4640c84 # This will be auto-updated by the pkgver() function below
pkgrel=1
pkgdesc="A simple and easy-to-use library to enjoy videogames programming (compiled natively for Wayland)"
arch=('x86_64' 'aarch64')
url="https://www.raylib.com/"
license=('Zlib')
options=(!debug)
depends=('wayland' 'libxkbcommon' 'glu')
makedepends=('git' 'cmake' 'wayland-protocols')
provides=('raylib')
conflicts=('raylib')
source=("git+https://github.com/raysan5/raylib.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLATFORM=Desktop \
    -DGLFW_BUILD_WAYLAND=ON \
    -DGLFW_BUILD_X11=OFF \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
