#$
#$ Cloned from armcl-opencl
#$
#
# Maintainer: EndlessEden <eden@rose.place>
#
# Contributor: Andrew Anderson <aanderso@tcd.ie>

pkgname=armcl-opencl-mali
pkgver=20.02.1
pkgrel=1

epoch=
pkgdesc="ARM Computer Vision and Machine Learning Library (x86_64 OpenCL Backend)"
arch=('aarch64')
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

NEON=0
case "$CARCH" in

 armv7h) HARCH='armv7a'
 if [ $(cat /proc/cpuinfo | grep "Features" | grep -c "neon") -gt "0" ]; then
  NEON=1
 else
  NEON=0
 fi
 ;;

 armv8h) HARCH="$CARCH"
  if [ $(cat /proc/cpuinfo | grep "Features" | grep -c "neon") -gt "0" ]; then
   NEON=1
  else
   NEON=0
  fi
  if [ $(cat /proc/cpuinfo | grep "CPU architecture" | tail -1 | sed 's/CPU architecture: //g') == '8.6' ]; then
   HARCH='armv8.6-a'
  fi
  if [ $(cat /proc/cpuinfo | grep "CPU architecture" | tail -1 | sed 's/CPU architecture: //g') == '8.2' ]; then
   if [ $(cat /proc/cpuinfo | grep "Features" | grep -c "sve") -gt "0" ]; then
    HARCH='armv8.2-a-sve'
   else
    HARCH='armv8.2-a'
   fi
  fi
  if [ $(cat /proc/cpuinfo | grep "CPU architecture" | tail -1 | sed 's/CPU architecture: //g') == '8' ]; then
   HARCH='armv8a'
  fi
  if [ $HARCH == $CARCH ]; then
   echo "Incompatible Arm Architecture. Only Arm version 8 is supported, Please verify your Arm Architecture Version is between 8 and 8.6 on $CARCH."
   exit 1
  fi
 ;;

 aarch64)HARCH="$CARCH"
  if [ $(cat /proc/cpuinfo | grep "Features" | grep -c "neon") -gt "0" ]; then
   NEON=1
  else
   NEON=0
  fi
  if [ $(cat /proc/cpuinfo | grep "CPU architecture" | tail -1 | sed 's/CPU architecture: //g') == '8.6' ]; then
   echo "Incompatible Arm Architecture. Arm64 is not compatible with Arm Archtectures greater than 8.2 at this time."
   exit 1
  fi
  if [ $(cat /proc/cpuinfo | grep "CPU architecture" | tail -1 | sed 's/CPU architecture: //g') == '8.2' ]; then
   if [ $(cat /proc/cpuinfo | grep "Features" | grep -c "sve") -gt "0" ]; then
    HARCH='arm64-v8.2-a-sve'
   else
    HARCH='arm64-v8.2-a'
   fi
  fi
  if [ $(cat /proc/cpuinfo | grep "CPU architecture" | tail -1 | sed 's/CPU architecture: //g') == '8' ]; then
   HARCH='arm64-v8a'
  fi
  if [ $HARCH == $CARCH ]; then
   echo "Incompatible Arm Architecture. Only Arm version 8 is supported, Please verify your Arm Architecture Version is between 8 and 8.2 on $CARCH."
   exit 1
  fi
 ;;
esac

  cd "${srcdir}/ComputeLibrary"
  git checkout "v$pkgver"
  if [ $NEON = "1" ]; then

   scons -j`cat /proc/cpuinfo | grep -i "processor" | wc -l` \
   os=linux arch=$HARCH build=native \
   Werror=0 debug=0 asserts=0 \
   neon=1 \
   opencl=1 gles_compute=1 embed_kernels=1 \
   examples=0 \
   set_soname=0 \
   openmp=1 cppthreads=1 \
   pmu=1 \
   mali=1 \
   validation_tests=0 \
   benchmark_tests=0 \
   extra_cxx_flags="-fPIC"

  else
 
   scons -j`cat /proc/cpuinfo | grep -i "processor" | wc -l` \
   os=linux arch=$HARCH build=native \
   Werror=0 debug=0 asserts=0 \
   neon=0 \
   opencl=1 gles_compute=1 embed_kernels=1 \
   examples=0 \
   set_soname=0 \
   openmp=1 cppthreads=1 \
   pmu=1 \
   mali=1 \
   validation_tests=0 \
   benchmark_tests=0 \
   extra_cxx_flags="-fPIC"
  fi
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
