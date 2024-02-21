# Maintainer: Eggz
# Contributor: PedroHLC <root@pedrohlc.com>

# Suggestion, you can found the exact required imgui version here:
#  http://nhameh.ovh/packages/x86_64/imgui-1.89.9-2-x86_64.pkg.tar.zst

_pkgname='raytracinginvulkan'
pkgname="${_pkgname}-git"
pkgver=7.r16.g5316859
pkgrel=1 # increasing this does not affect VCS packages, pkgver replaces it
pkgdesc="Implementation of Peter Shirley's Ray Tracing In One Weekend book"
arch=('x86_64')
url='https://github.com/GPSnoopy/RayTracingInVulkan'
license=('BSD')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('boost-libs' 'glfw-x11' 'glm' 'imgui=1.89.9' 'tinyobjloader' 'vulkan-icd-loader' 'glslang' 'freetype2' 'mangohud')
optdepends=(
  'nvidia-utils: Includes vulkan driver for NVIDIA'
  'vulkan-radeon: 1st best vulkan driver for AMD'
  'vulkan-amdgpu-pro: 2nd best vulkan driver for AMD'
  'amdvlk: 3rd best vulkan driver for AMD'
  'vulkan-intel: Includes vulkan driver for NVIDIA'
)
makedepends=('cmake' 'boost' 'vulkan-headers' 'stb')

source=("${_pkgname}::git+${url}.git" 'glslang.patch')
sha256sums=('SKIP' '4cd8b72df0816b2d0140c0f840e8e619ea48101ad01636dfa9ff3ab0b65ce99a')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^r//g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Go to stable commit
  git checkout 5316859

  # fix freetype
  sed -i'' 's/find_package(freetype CONFIG/find_package(Freetype/' CMakeLists.txt
  sed -i'' 's/glm::glm/glm/;s/\${Boost_LIBRARIES} freetype/\${Boost_LIBRARIES} Freetype::Freetype/g' src/CMakeLists.txt
  mkdir -p build

  # Implement all packaged patches and reverts.
  cd "${_srcname}"
  msg2 "Hard fixes"
  echo "Forcing stb dir" #Something is up/changed with find stb, had to force the dir location for it to work...
  sed -i 's/find_package(Stb REQUIRED)/set(Stb_INCLUDE_DIR ${STB_INCLUDE_DIRS})/g' CMakeLists.txt
  msg2 "Implementing custom patches"
  while read patch; do
   if [ "$patch" == "" ]; then
    continue
   fi
   echo "applying $patch"
   git apply $patch || exit 2
  done <<< $(ls ../*.patch)
}

build() {
  cd "${srcdir}/${_pkgname}/build"

  cmake \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D STB_INCLUDE_DIRS=/usr/include/stb \
    -D CMAKE_BUILD_TYPE=Release \
    -D Boost_USE_STATIC_LIBS=OFF \
    -D Boost_USE_MULTITHREADED=ON \
    -D Boost_NO_BOOST_CMAKE=ON \
    -D Boost_USE_STATIC_RUNTIME=OFF \
    -D Backtrace_LIBRARIES="-ldl" \
    ..
  make VERBOSE=1 -j
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  install -dm755 "$pkgdir/opt/${_pkgname}/bin"
  install -dm755 "$pkgdir/opt/${_pkgname}/assets"

  install -m755 bin/RayTracer "$pkgdir/opt/${_pkgname}/bin/RayTracer"
  cp -dr --no-preserve=ownership \
    -t "$pkgdir/opt/${_pkgname}/assets/" \
    assets/{fonts,models,textures,shaders}
}
