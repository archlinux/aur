pkgname=mingw-w64-raytracinginvulkan
pkgver=r6
pkgrel=1
pkgdesc="Implementation of Peter Shirley's Ray Tracing In One Weekend book (mingw-w64)"
license=('BSD')
arch=('any')
url="https://github.com/GPSnoopy/RayTracingInVulkan"
depends=('mingw-w64-vulkan-icd-loader' 'mingw-w64-glfw' 'mingw-w64-boost')
makedepends=('mingw-w64-cmake' 'mingw-w64-stb-git')
# 'mingw-w64-glm')
options=('!buildflags' 'staticlibs' '!strip')
source=("git+https://github.com/GPSnoopy/RayTracingInVulkan.git")
sha256sums=(SKIP)

_architectures="x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/RayTracingInVulkan"
  curl -L https://github.com/GPSnoopy/RayTracingInVulkan/pull/45.patch | patch -p1
  curl -L https://github.com/GPSnoopy/RayTracingInVulkan/pull/42.patch | patch -p1
  curl -L https://github.com/GPSnoopy/RayTracingInVulkan/pull/43.patch | patch -p1
}

build() {
  cd "$srcdir/RayTracingInVulkan"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/RayTracingInVulkan/build-${_arch}"
    make DESTDIR="$pkgdir" install
  done
}
