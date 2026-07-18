# Maintainer: Monjaris <ziyanovruzlu750@gmail.com>
pkgname=raylib-wayland-git
_pkgname=raylib
pkgver=6.0.r239.g5b1445b
pkgrel=5
pkgdesc="Optimized Wayland build for simple and easy-to-use graphics library raylib"
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
  export CFLAGS="${CFLAGS} -O3"
  export CXXFLAGS="${CXXFLAGS} -O3"

  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPLATFORM=SDL \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
