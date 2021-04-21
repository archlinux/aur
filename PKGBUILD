# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname='raytracinginvulkan'
pkgname="${_pkgname}-git"
pkgver='6.r15.ga0d6f87'
pkgrel=1
pkgdesc="Implementation of Peter Shirley's Ray Tracing In One Weekend book"
arch=('x86_64')
url='https://github.com/GPSnoopy/RayTracingInVulkan'
license=('BSD')

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source=("${_pkgname}::git+${url}.git")
depends=('boost-libs' 'glfw-x11' 'glm' 'imgui' 'tinyobjloader' 'vulkan-icd-loader' 'glslang')
makedepends=('cmake' 'boost' 'vulkan-headers' 'stb')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^r//g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build
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
