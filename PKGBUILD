# Maintainer: Jari Vetoniemi <mailroxas@gmail.com>

_pkgbase=lib32-glfw
pkgbase="$_pkgbase-git"
pkgname=("$_pkgbase-x11-git" "$_pkgbase-wayland-git")
pkgver=3.2.1.r517.gf4cd470b
pkgrel=1
arch=('x86_64')
url="http://www.glfw.org/"
license=('custom:ZLIB')
optdepends=('doxygen: build glfw html documentation')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'lib32-libxi' 'lib32-libxrandr' 'lib32-libxinerama' 'lib32-libxcursor' 'lib32-wayland' 'wayland-protocols' 'lib32-libxkbcommon' 'lib32-mesa')
conflicts=("$_pkgbase")
provides=("$_pkgbase=3.3")
source=("$_pkgbase::git+https://github.com/glfw/glfw")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p $_pkgbase/build-x11
  mkdir -p $_pkgbase/build-wayland
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_pkgbase/build-x11
  cmake \
    -DLIB_SUFFIX=32 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DGLFW_BUILD_EXAMPLES=OFF \
    -DGLFW_BUILD_TESTS=OFF \
    -Wno-dev \
    ..
  make

  cd ../build-wayland
  cmake \
    -DLIB_SUFFIX=32 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DGLFW_BUILD_EXAMPLES=OFF \
    -DGLFW_BUILD_TESTS=OFF \
    -DGLFW_USE_WAYLAND=ON \
    -Wno-dev \
    ..
  make
}

package_lib32-glfw-x11-git() {
  depends=('lib32-libxi' 'lib32-libxrandr' 'lib32-libxinerama' 'lib32-libxcursor')
  optdepends=('lib32-libgl: for OpenGL support'
              'lib32-opengl-driver: for OpenGL support'
              'lib32-vulkan-icd-loader: for Vulkan support'
              'lib32-vulkan-driver: for Vulkan support')
  pkgdesc="A free, open source, portable framework for OpenGL application development. (git, X11 version)"

  cd $_pkgbase/build-x11
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -r "$pkgdir"/usr/include/GLFW
}

package_lib32-glfw-wayland-git() {
  depends=('lib32-wayland' 'lib32-libxkbcommon')
  optdepends=('lib32-libgl: for OpenGL support'
              'lib32-opengl-driver: for OpenGL support'
              'lib32-vulkan-icd-loader: for Vulkan support'
              'lib32-vulkan-driver: for Vulkan support')
  pkgdesc="A free, open source, portable framework for OpenGL application development. (git, Wayland version)"

  cd $_pkgbase/build-wayland
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -r "$pkgdir"/usr/include/GLFW
}

# vim:set ts=2 sw=2 et:
