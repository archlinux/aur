# Maintainer: Paul Orzel <pb.orzel@proton.me>
# Note: 99.9% is copied from linux-wallpaperengine-git (Maintainer: Alexis Maiquez <aur@almamu.com>)
pkgname=linux-wallpaperengine-wayland-git
_pkgname=linux-wallpaperengine
pkgver=r411.660f798
pkgrel=1
pkgdesc="use steam's wallpaperengine on linux"
arch=('x86_64')
url="https://github.com/Almamu/linux-wallpaperengine"
license=('GPL3')
depends=('lz4' 'ffmpeg' 'mpv' 'freeimage' 'xorg-xrandr' 'glfw-x11' 'glew' 'freeglut' 'libpulse' 'wayland')
makedepends=('git' 'cmake' 'sdl2' 'glm')
source=("${pkgname}::git+https://github.com/Almamu/linux-wallpaperengine.git#branch=main")
sha512sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd "$pkgname"
        ( set -o pipefail
          git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DENABLE_WAYLAND=True \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
