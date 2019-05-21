# Maintainer: Andrew Anderson <aanderso@tcd.ie>

pkgname=aarch64-linux-gnu-armcl-neon
pkgver=19.02
pkgrel=3

epoch=
pkgdesc="ARM Computer Vision and Machine Learning Library (arm64-v8a NEON Backend)"
arch=( 'x86_64' )
url="https://github.com/ARM-software/ComputeLibrary"
license=('MIT')
groups=()
depends=()
makedepends=( 'scons>=2.3' 'git' 'doxygen>=1.8.5' 'aarch64-linux-gnu-gcc' )
checkdepends=()
optdepends=()
provides=()
conflicts=( 'aarch64-linux-gnu-armcl-opencl+neon' )
replaces=()
backup=()
options=( !strip )
install=
changelog=
source=("git+https://github.com/ARM-software/ComputeLibrary.git")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/ComputeLibrary"
  git checkout "v$pkgver"
  scons -j`cat /proc/cpuinfo | grep -i "processor" | wc -l` \
  os=linux arch=arm64-v8a build=cross_compile \
  Werror=0 debug=0 asserts=0 \
  neon=1 \
  opencl=0 gles_compute=0 embed_kernels=0 \
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
  mkdir -p ${pkgdir}/usr/aarch64-linux-gnu/lib/
  cp -r build/*.a ${pkgdir}/usr/aarch64-linux-gnu/lib/
  cp -r build/*.so ${pkgdir}/usr/aarch64-linux-gnu/lib/

  mkdir -p ${pkgdir}/usr/aarch64-linux-gnu/include/arm_compute/
  cp -r arm_compute/* ${pkgdir}/usr/aarch64-linux-gnu/include/arm_compute/
  cp -r support ${pkgdir}/usr/aarch64-linux-gnu/include/arm_compute/
  cp -r include/* ${pkgdir}/usr/aarch64-linux-gnu/include/arm_compute/
  cp -r utils ${pkgdir}/usr/aarch64-linux-gnu/include/arm_compute/
}
