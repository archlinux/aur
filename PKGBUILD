_pkgname=imgui
pkgname=imgui-full
# On each update, keep up to date with latest sha in https://github.com/microsoft/vcpkg/commits/master/ports/imgui
_vcpkg_sha=16601c6e7ee15aeccac771185916cd6f6fe1ba50
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.91.6
pkgrel=1
pkgdesc="Bloat-free Graphical User interface for C++"
license=('MIT')
arch=('x86_64')
url="https://github.com/ocornut/imgui"
depends=('gcc-libs')
makedepends=('cmake')
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/ocornut/imgui/tar.gz/v${pkgver}"
        "CMakeLists.v${pkgver}-${pkgrel}.txt::https://raw.githubusercontent.com/microsoft/vcpkg/${_vcpkg_sha}/ports/imgui/CMakeLists.txt"
        "imgui-config.v${pkgver}-${pkgrel}.cmake.in::https://raw.githubusercontent.com/microsoft/vcpkg/${_vcpkg_sha}/ports/imgui/imgui-config.cmake.in")
sha256sums=('c5fbc5dcab1d46064001c3b84d7a88812985cde7e0e9ced03f5677bec1ba502a'
            '469172229e8a2e6ddb00105c4a764fa452ab143d21edd0b30cea589bf0b75191'
            '2a441c1709b0ec7c0de1f403944ba5b8d8c059c02adcea9f8550bf33303eb7bb')

prepare () {
  cp CMakeLists.v${pkgver}-${pkgrel}.txt        ${_pkgname}-${pkgver}/CMakeLists.txt
  cp imgui-config.v${pkgver}-${pkgrel}.cmake.in ${_pkgname}-${pkgver}/imgui-config.cmake.in
}

build() {
  cd $_pkgname-$pkgver
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DIMGUI_BUILD_GLFW_BINDING=ON \
    -DIMGUI_BUILD_GLUT_BINDING=ON \
    -DIMGUI_BUILD_SDL2_BINDING=ON \
    -DIMGUI_BUILD_SDL2_RENDERER_BINDING=ON \
    -DIMGUI_BUILD_VULKAN_BINDING=ON \
    -DIMGUI_BUILD_OPENGL2_BINDING=ON \
    -DIMGUI_BUILD_OPENGL3_BINDING=ON \
    -S. \
    -B cmake-build-shared
  cmake --build cmake-build-shared
}

package() {
  cd $_pkgname-$pkgver
  make -C cmake-build-shared DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
