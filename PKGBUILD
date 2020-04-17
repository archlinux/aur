# Maintainer: Andrew Anderson <aanderso@tcd.ie>

pkgname=armcl-opencl
pkgver=20.02.1
pkgrel=1

epoch=
pkgdesc="ARM Computer Vision and Machine Learning Library (x86_64 OpenCL Backend)"
arch=( 'x86_64' )
url="https://github.com/ARM-software/ComputeLibrary"
license=('MIT')
groups=()
depends=()
makedepends=( 'scons>=2.3' 'git' 'doxygen>=1.8.5' )
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=( '!strip' '!emptydirs' 'staticlibs' )
install=
changelog=
source=("git+https://github.com/ARM-software/ComputeLibrary.git")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/ComputeLibrary"
  git checkout "v$pkgver"
  scons -j`cat /proc/cpuinfo | grep -i "processor" | wc -l` \
  os=linux arch=x86_64 build=native \
  Werror=0 debug=0 asserts=0 \
  neon=0 \
  opencl=1 gles_compute=0 embed_kernels=1 \
  examples=0 \
  set_soname=0 \
  openmp=0 cppthreads=1 \
  pmu=0 \
  mali=0 \
  validation_tests=0 \
  benchmark_tests=0 \
  extra_cxx_flags="-fPIC"
}

#check() {}

package() {
  cd "${srcdir}/ComputeLibrary"
  mkdir -p ${pkgdir}/usr/lib/
  cp -r build/*.a ${pkgdir}/usr/lib/
  cp -r build/*.so ${pkgdir}/usr/lib/

  # The Compute Library OpenCL runtime
  mkdir -p ${pkgdir}/usr/lib/arm_compute/
  cp -r build/src/runtime/CL/* ${pkgdir}/usr/lib/arm_compute/

  mkdir -p ${pkgdir}/usr/include/arm_compute/
  cp -r arm_compute/* ${pkgdir}/usr/include/arm_compute/
  cp -r support ${pkgdir}/usr/include/arm_compute/
  cp -r include/* ${pkgdir}/usr/include/arm_compute/
  cp -r utils ${pkgdir}/usr/include/arm_compute/
}
