# Maintainer: Suikol < gouhexieji@gmail.com >
# Contributor: RecursiveG < g.recursive@gmail.com >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>
# Contributor: Axper Jan <483ken _at_ gmail _dot_ com
# Contributor: Daniel Kirchner <ekpyron at lavabit dot com>

_pkgbase=glfw
pkgname=glfw-fcitx5-fix-git
pkgver=3.4.r108.g463cf736
pkgrel=1
pkgdesc="Free, open source, portable framework for OpenGL application development, with fcitx5 input fix (git version)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Suikol/glfw-fcitx5-fix"
license=('Zlib')
depends=('libgl' 'libxkbcommon')
makedepends=('mesa' 'cmake' 'doxygen' 'vulkan-headers' 'vulkan-icd-loader'
             'extra-cmake-modules' 'wayland-protocols' 'libxi' 'libxrandr'
             'libxcursor' 'libxinerama' 'git' 'ninja')
conflicts=('glfw' 'glfw-x11' 'glfw-wayland')
provides=('glfw' 'glfw-x11')
replaces=('glfw-x11-git' 'glfw-wayland-git')
optdepends=('libgl: for OpenGL support'
            'opengl-driver: for OpenGL support'
            'vulkan-icd-loader: for Vulkan support'
            'vulkan-driver: for Vulkan support')
source=("$_pkgbase::git+https://github.com/glfw/glfw"
        "0001-Properly-discard-filtered-events-by-XFilterEvent.patch")
sha256sums=('SKIP'
            '2263e5f15a92cc4ad636a7df97ef844a9ddd2035510eb60e4f694f76245db974')

pkgver() {
  cd $_pkgbase
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgbase"
	patch -p1 -i "$srcdir/0001-Properly-discard-filtered-events-by-XFilterEvent.patch"
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
    -DGLFW_BUILD_WAYLAND=OFF \
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
