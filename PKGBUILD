# Contributor: Axper Jan <483ken _at_ gmail _dot_ com
# Contributor: Daniel Kirchner <ekpyron at lavabit dot com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>
# Maintainer: Celeste Peláez <celeste@etheryal.net

_pkgbase=glfw
pkgname=glfw-git-minecraft
pkgver=3.3.r781.g3eaf1255
pkgrel=1
pkgdesc="Free, open source, portable framework for OpenGL application development (git version, patched for Minecraft with Wayland support)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/KernelFreeze/glfw-minecraft"
license=('custom:ZLIB')
depends=('libxi' 'libxrandr' 'libxinerama' 'libxcursor' 'wayland' 'libxkbcommon')
makedepends=('git' 'cmake' 'ninja' 'doxygen' 'wayland-protocols' 'mesa')
conflicts=('glfw' 'glfw-x11' 'glfw-wayland')
provides=('glfw' 'glfw-x11' 'glfw-wayland')
replaces=('glfw-x11-git' 'glfw-wayland-git' 'glfw-git')
optdepends=('libgl: for OpenGL support'
            'opengl-driver: for OpenGL support'
            'vulkan-icd-loader: for Vulkan support'
            'vulkan-driver: for Vulkan support')
source=("$_pkgbase::git+https://github.com/glfw/glfw"
        "0001-Don-t-crash-on-calls-to-focus-or-icon.patch"
        "0002-Platform-Prefer-Wayland-over-X11.patch")
sha512sums=('SKIP'
            '585d8f06d59ab44edd242a5dded1efcf5f7c0feeef13188534eefe85d324d724c5b90ac444be8365058efa553e437be57eb6d21f28f089f24cdef68c72f29f34'
            'c8f59dcc5376a6e74d7d072a43f7fa22253052b9e9ae1c99bdab8a779096d2e3a374f11723a57e0ca1f767dbac0fbb3e5cb0439c59096423114c7ab5d54d74af')

pkgver() {
  cd $_pkgbase
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgbase
  for patch in "$srcdir/"*.patch; do
    echo "Applying patch $patch"
    patch -p1 < "$patch"
  done
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
