# Contributor: Axper Jan <483ken _at_ gmail _dot_ com
# Contributor: Daniel Kirchner <ekpyron at lavabit dot com>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Maintainer: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>

_pkgbase=glfw
pkgname=glfw-git
pkgver=3.3.r470.g56a4cb0a
pkgrel=1
pkgdesc="Free, open source, portable framework for OpenGL application development (git version)"
arch=('x86_64' 'armv7h' 'aarch64')
url="http://www.glfw.org/"
license=('custom:ZLIB')
depends=('libxi' 'libxrandr' 'libxinerama' 'libxcursor' 'wayland' 'libxkbcommon')
makedepends=('git' 'cmake' 'ninja' 'doxygen' 'wayland-protocols' 'mesa')
conflicts=('glfw' 'glfw-x11' 'glfw-wayland')
provides=('glfw' 'glfw-x11' 'glfw-wayland')
replaces=('glfw-x11-git' 'glfw-wayland-git')
optdepends=('libgl: for OpenGL support'
            'opengl-driver: for OpenGL support'
            'vulkan-icd-loader: for Vulkan support'
            'vulkan-driver: for Vulkan support')
source=("$_pkgbase::git+https://github.com/glfw/glfw")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  mkdir -p $_pkgbase/build
  cd $_pkgbase/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DGLFW_BUILD_EXAMPLES=OFF \
    -DGLFW_BUILD_TESTS=OFF \
    -DGLFW_BUILD_WAYLAND=ON \
    -Wno-dev \
    -G Ninja \
    ..
  ninja
}

package() {
  cd $_pkgbase/build
  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
