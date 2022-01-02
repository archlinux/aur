# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Hubert Jarosz <marqin.pl+aur at gmail dot com> PGP: 0xFFECF63C1AAB83FF

pkgname=renderdoc-git
pkgver=1.17
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool"
arch=(i686 x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
makedepends=("cmake" "ninja" "python")
depends=("wayland" "libx11" "libxcb" "mesa" "libgl" "qt5-base" "qt5-svg" "qt5-x11extras" "xcb-util-keysyms")
source=("git+https://github.com/baldurk/renderdoc")
sha256sums=('SKIP')
conflicts=('renderdoc')
provides=("renderdoc=${pkgver%+*}")

pkgver() {
  cd "${srcdir}"/renderdoc
  git describe --always --abbrev=10 HEAD |
    sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_VERSION_DIST_CONTACT="https://aur.archlinux.org/packages/renderdoc-git" \
        -DBUILD_VERSION_DIST_NAME="Arch" \
        -DBUILD_VERSION_DIST_VER="${pkgver}" \
        -S renderdoc -B build \
        -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
