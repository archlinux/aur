# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lib32-egl-wayland-git
pkgver=1.1.9.r2.gdaab854
pkgrel=1
pkgdesc='EGLStream-based Wayland external platform (GIT version)(32-bit)'
arch=('x86_64')
url='https://github.com/NVIDIA/egl-wayland'
license=('MIT')
depends=('lib32-wayland'
         "egl-wayland-git=${pkgver}"
         )
makedepends=('meson'
             'git'
             'eglexternalplatform'
             'wayland-protocols'
             'lib32-libglvnd'
             )
provides=('lib32-egl-wayland'
          'libnvidia-egl-wayland.so'
          )
conflicts=('lib32-egl-wayland')
options=('!emptydirs')
source=("git+https://github.com/NVIDIA/egl-wayland.git")
sha256sums=('SKIP')

pkgver() {
  git -C egl-wayland describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  arch-meson egl-wayland build \
    --libdir=/usr/lib32

  ninja -C build
}

check(){
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share"
  rm -rf "${pkgdir}/usr/bin"

  install -Dm644 egl-wayland/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
