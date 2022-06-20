# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-egl-wayland
pkgver=1.1.10
pkgrel=1
pkgdesc='EGLStream-based Wayland external platform (32-bit)'
arch=('x86_64')
url='https://github.com/NVIDIA/egl-wayland'
license=('MIT')
depends=('lib32-wayland'
         "egl-wayland=2:${pkgver}"
         )
makedepends=('meson'
             'git'
             'lib32-libglvnd'
             )
provides=('libnvidia-egl-wayland.so')
options=('!emptydirs')
source=("git+https://github.com/NVIDIA/egl-wayland#commit=247335d5d451bc56af08781c70f8bc96926cbf23")
sha256sums=('SKIP')

pkgver() {
  cd egl-wayland
#   echo $(git describe --tags | tr - +)
  echo "$(git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g')"
}

prepare() {
  cd $_basename
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  arch-meson egl-wayland build \
    --libdir=/usr/lib32

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share"
  rm -rf "${pkgdir}/usr/bin"

  install -Dm644 egl-wayland/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
