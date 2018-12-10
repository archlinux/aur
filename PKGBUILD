# Maintainer: Andrew Anderson <aanderso@tcd.ie>

pkgname=arm-linux-gnueabihf-armcl-neon
pkgver=18.11
pkgrel=1

epoch=
pkgdesc="ARM Computer Vision and Machine Learning Library (armv7a NEON Backend)"
arch=( 'x86_64' )
url="https://github.com/ARM-software/ComputeLibrary"
license=('MIT')
groups=()
depends=()
makedepends=( 'scons>=2.3' 'git' 'doxygen>=1.8.5' )
checkdepends=()
optdepends=()
provides=()
conflicts=( 'arm-linux-gnueabihf-armcl-opencl+neon' )
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
  os=linux arch=armv7a build=cross_compile \
  Werror=0 debug=0 asserts=0 \
  neon=1 \
  opencl=0 gles_compute=0 embed_kernels=0 \
  examples=0 \
  set_soname=0 \
  openmp=0 cppthreads=1 \
  pmu=0 \
  mali=0 \
  validation_tests=0 \
  benchmark_tests=0
}

#check() {}

package() {
  cd "${srcdir}/ComputeLibrary"
  mkdir -p ${pkgdir}/usr/arm-linux-gnueabihf/lib/
  cp -r build/*.a ${pkgdir}/usr/arm-linux-gnueabihf/lib/
  cp -r build/*.so ${pkgdir}/usr/arm-linux-gnueabihf/lib/

  mkdir -p ${pkgdir}/usr/arm-linux-gnueabihf/include/arm_compute/
  cp -r arm_compute/* ${pkgdir}/usr/arm-linux-gnueabihf/include/arm_compute/
  cp -r support ${pkgdir}/usr/arm-linux-gnueabihf/include/arm_compute/
  cp -r include/* ${pkgdir}/usr/arm-linux-gnueabihf/include/arm_compute/
}
