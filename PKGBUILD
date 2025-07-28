_pkgname=imgui
pkgname=imgui-full
# On each update, keep up to date with latest sha in https://github.com/microsoft/vcpkg/commits/master/ports/imgui
_vcpkg_sha=b02e341c927f16d991edbd915d8ea43eac52096c
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.92.1
pkgrel=1
pkgdesc="Bloat-free Graphical User interface for C++"
license=('MIT')
arch=('x86_64')
url="https://github.com/ocornut/imgui"
depends=('gcc-libs')
makedepends=('cmake' 'glu' 'freeglut' 'sdl3' 'glfw' 'vulkan-headers')
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/ocornut/imgui/tar.gz/v${pkgver}"
  "CMakeLists.v${pkgver}-${pkgrel}.txt::https://raw.githubusercontent.com/microsoft/vcpkg/${_vcpkg_sha}/ports/imgui/CMakeLists.txt"
  "imgui-config.v${pkgver}-${pkgrel}.cmake.in::https://raw.githubusercontent.com/microsoft/vcpkg/${_vcpkg_sha}/ports/imgui/imgui-config.cmake.in")
sha256sums=('32c237c2abf67a2ffccaac17192f711d4a787554b4133187a153d49057d6109c'
  '257e81df093db871165b6ad2f072a613fb84de69e3e45d21d09036a9c840624b'
  '5da843cca9f52801645959f6318ebcb867837b1523924dc535d9f418abb19ae8')

prepare() {
  cp CMakeLists.v${pkgver}-${pkgrel}.txt ${_pkgname}-${pkgver}/CMakeLists.txt
  cp imgui-config.v${pkgver}-${pkgrel}.cmake.in ${_pkgname}-${pkgver}/imgui-config.cmake.in
}

build() {
  cd $_pkgname-$pkgver
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DIMGUI_BUILD_GLFW_BINDING=ON \
    -DIMGUI_BUILD_GLUT_BINDING=ON \
    -DIMGUI_BUILD_SDL3_BINDING=ON \
    -DIMGUI_BUILD_SDL3_RENDERER_BINDING=ON \
    -DIMGUI_BUILD_SDLGPU3_BINDING=ON \
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
