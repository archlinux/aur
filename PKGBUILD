# Contributor: Eggz
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname='raytracinginvulkan'
_imgui_ver=1.91.6
_vcpkg_sha=16601c6e7ee15aeccac771185916cd6f6fe1ba50

pkgname="${_pkgname}-git"
pkgver=7.r32.g92170b6
pkgrel=1
pkgdesc="Implementation of Peter Shirley's Ray Tracing In One Weekend book"
arch=('x86_64')
url='https://github.com/GPSnoopy/RayTracingInVulkan'
license=('BSD-3-Clause')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('boost-libs' 'glfw' 'glm' 'tinyobjloader' 'vulkan-icd-loader' 'glslang' 'freetype2' 'mangohud')
optdepends=(
  'nvidia-utils: Includes vulkan driver for NVIDIA'
  'vulkan-radeon: 1st best vulkan driver for AMD'
  'vulkan-amdgpu-pro: 2nd best vulkan driver for AMD'
  'amdvlk: 3rd best vulkan driver for AMD'
  'vulkan-intel: Includes vulkan driver for Intel'
)
makedepends=('cmake' 'boost' 'vulkan-headers' 'stb' 'git')
source=("${_pkgname}::git+${url}.git"
        "imgui-${_imgui_ver}.tar.gz::https://github.com/ocornut/imgui/archive/refs/tags/v${_imgui_ver}.tar.gz"
        "CMakeLists.${_imgui_ver}.txt::https://raw.githubusercontent.com/microsoft/vcpkg/${_vcpkg_sha}/ports/imgui/CMakeLists.txt"
        "imgui-config.${_imgui_ver}.cmake.in::https://raw.githubusercontent.com/microsoft/vcpkg/${_vcpkg_sha}/ports/imgui/imgui-config.cmake.in"
        "imgui-cmake.patch"
	"RayTracer"
)
sha256sums=('SKIP'
            'c5fbc5dcab1d46064001c3b84d7a88812985cde7e0e9ced03f5677bec1ba502a'
            '469172229e8a2e6ddb00105c4a764fa452ab143d21edd0b30cea589bf0b75191'
            '2a441c1709b0ec7c0de1f403944ba5b8d8c059c02adcea9f8550bf33303eb7bb'
            'e7706c6bd8143b9faddc3eabb16e016d4f84e605c402d459fdc5036170a4b365'
            '2dbf05310df36933b0263cbe5ccfe8b9ef042326797e63eb4449eabc22e5c2f5')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^r//g'
}

prepare() {
  cd "${_pkgname}"

  # fix STB location with cmake
  sed -i 's/find_package(Stb REQUIRED)/set(Stb_INCLUDE_DIR ${STB_INCLUDE_DIRS})/g' CMakeLists.txt
  cd ..

  # prepare imgui static compilation
  cp CMakeLists.${_imgui_ver}.txt        imgui-$_imgui_ver/CMakeLists.txt
  cp imgui-config.${_imgui_ver}.cmake.in imgui-$_imgui_ver/imgui-config.cmake.in
  cd imgui-$_imgui_ver
  patch -p1 < ../imgui-cmake.patch
}

build() {
  # first build imgui
  cmake -B build-imgui -S imgui-$_imgui_ver \
    -DCMAKE_INSTALL_PREFIX="$srcdir/temp" \
    -DIMGUI_FREETYPE=ON \
    -DIMGUI_BUILD_VULKAN_BINDING=ON \
    -DIMGUI_BUILD_GLFW_BINDING=ON \
    -Wno-dev

  cmake --build build-imgui
  cmake --install build-imgui

  # build raytracing
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_PREFIX_PATH="$srcdir/temp" \
    -DSTB_INCLUDE_DIRS=/usr/include/stb \
    -DCMAKE_BUILD_TYPE=Release \
    -DBoost_USE_STATIC_LIBS=OFF \
    -DBoost_USE_MULTITHREADED=ON \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DBoost_USE_STATIC_RUNTIME=OFF \
    -DBacktrace_LIBRARIES="-ldl"

  cmake --build build
}

package() {
  cd build
  install -dm755 "$pkgdir/opt/${_pkgname}/bin"
  install -dm755 "$pkgdir/opt/${_pkgname}/assets"

  install -m755 bin/RayTracer "$pkgdir/opt/${_pkgname}/bin/RayTracer"
  cp -dr --no-preserve=ownership \
    -t "$pkgdir/opt/${_pkgname}/assets/" \
    assets/{fonts,models,textures,shaders}

  cd ../${_pkgname}
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  cd ..
  install -Dm755 RayTracer -t "$pkgdir/usr/bin/"
}
