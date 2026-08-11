# Maintainer: aur.chaotic.cx

_pkgname="opencv4"
pkgname="$_pkgname-llvm"
pkgver=4.14.0
pkgrel=2
pkgdesc="Open Source Computer Vision Library (version 4.x) — built with Clang and LLVM lld"
url="https://github.com/opencv/opencv"
license=('Apache-2.0')
arch=('x86_64')
provides=('opencv4')
conflicts=('opencv4')

depends=(
  abseil-cpp
  cblas
  ffmpeg
  freetype2
  glib2
  gst-plugins-base
  gst-plugins-base-libs
  gstreamer
  harfbuzz
  lapack
  libdc1394
  libgcc
  libglvnd
  libjpeg-turbo
  libjxl
  libpng
  libstdc++
  libtiff
  libwebp
  openexr
  openjpeg2
  protobuf
  tbb
  verdict
  zlib
)
makedepends=(
  ant
  clang
  cmake
  eigen
  fast_float
  fmt
  glew
  hdf5
  java-environment
  lapacke
  lld
  llvm
  mesa
  ninja
  nlohmann-json
  openmpi
  pugixml
  python-numpy
  python-setuptools
  qt6-5compat
  vtk
)
optdepends=(
  'glew: for the viz module'
  'hdf5: for the HDF5 module'
  'java-runtime: Java interface'
  'opencl-icd-loader: For coding with OpenCL'
  'qt6-base: for the HighGUI module'
  'vtk: for the viz module'
)

_pkgsrc="opencv-$pkgver"
_pkgsrc_contrib="opencv_contrib-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext"
  "$_pkgsrc_contrib.$_pkgext"::"${url}_contrib/archive/refs/tags/$pkgver.$_pkgext"
  vtk9.patch
  fix-cuda-flags.patch
  fix-ffmpeg9.patch
  fix-std.patch
)
sha256sums=(
  'ee8fb9b30eb60850431b4656447080e3737b56e45719c92b67f245950609f86e'
  '4f17abd1bc7f88e19c3380c8de7cbf2d863aced5b5ee8d8934cc7902b67d42c9'
  'f35a2d4ea0d6212c7798659e59eda2cb0b5bc858360f7ce9c696c77d3029668e'
  '95472ecfc2693c606f0dd50be2f012b4d683b7b0a313f51484da4537ab8b2bfe'
  '92451cb4b9f923c26cd8104a2872df7a59027c972767ec5ee4ea69af12c0aac0'
  'c05fe7572ee5193cf3de7f02a500f446f3457ec20c315590a326bf1bfb5552cc'
)

prepare() {
  # Don't require all vtk optdepends
  patch -d "$_pkgsrc" -Np1 -F100 -i ../vtk9.patch

  # OpenCV passes all CXXFLAGS to nvcc through -Xcompiler, which does not work for '-Wp,something' flags
  # We remove the -Xcompiler and pass our CXXFLAGS through cmake's CUDAFLAGS
  patch -d "$_pkgsrc" -Np1 -F100 -i ../fix-cuda-flags.patch

  # FFmpeg 9 removed deprecated AVCodec configuration fields
  patch -d "$_pkgsrc" -Np1 -i ../fix-ffmpeg9.patch

  patch -d "$_pkgsrc_contrib" -Np1 -F100 -i ../fix-std.patch
}

build() {
  export JAVA_HOME="/usr/lib/jvm/default"
  export CC=clang
  export CXX=clang++
  export AR=/usr/bin/llvm-ar
  export RANLIB=/usr/bin/llvm-ranlib
  export LD=/usr/bin/ld.lld
  export NM=/usr/bin/llvm-nm
  export OBJCOPY=/usr/bin/llvm-objcopy
  export OBJDUMP=/usr/bin/llvm-objdump
  export READELF=/usr/bin/llvm-readelf
  export STRIP=/usr/bin/llvm-strip
  export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
  export CFLAGS="${CFLAGS:-} -O3 -march=native"
  export CXXFLAGS="${CXXFLAGS:-} -O3 -march=native"

  local cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR="lib/$_pkgname"
    -DCMAKE_C_COMPILER=clang
    -DCMAKE_CXX_COMPILER=clang++
    -DCMAKE_AR=/usr/bin/llvm-ar
    -DCMAKE_RANLIB=/usr/bin/llvm-ranlib
    -DCMAKE_NM=/usr/bin/llvm-nm
    -DCMAKE_OBJCOPY=/usr/bin/llvm-objcopy
    -DCMAKE_OBJDUMP=/usr/bin/llvm-objdump
    -DCMAKE_READELF=/usr/bin/llvm-readelf
    -DCMAKE_STRIP=/usr/bin/llvm-strip
    -DCMAKE_CXX_STANDARD=17
    -DCMAKE_EXE_LINKER_FLAGS:STRING='-fuse-ld=lld'
    -DCMAKE_SHARED_LINKER_FLAGS:STRING='-fuse-ld=lld'
    -DCMAKE_MODULE_LINKER_FLAGS:STRING='-fuse-ld=lld'
    -Wno-dev

    -DBUILD_EXAMPLES=OFF
    -DINSTALL_C_EXAMPLES=OFF
    -DINSTALL_PYTHON_EXAMPLES=OFF

    -DWITH_OPENCL=ON
    -DWITH_OPENGL=ON
    -DOpenGL_GL_PREFERENCE=LEGACY
    -DWITH_TBB=ON
    -DWITH_VULKAN=ON
    -DWITH_QT=ON
    -DWITH_JPEGXL=ON
    -DBUILD_TESTS=OFF
    -DBUILD_PERF_TESTS=OFF
    -DBUILD_PROTOBUF=OFF
    -DPROTOBUF_UPDATE_FILES=ON
    -DCPU_BASELINE_DISABLE=SSE3
    -DCPU_BASELINE_REQUIRE=SSE2
    -DOPENCV_EXTRA_MODULES_PATH="$srcdir/$_pkgsrc_contrib/modules"
    -DOPENCV_SKIP_PYTHON_LOADER=ON
    # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
    -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so"
    -DLAPACK_CBLAS_H=/usr/include/cblas.h
    -DLAPACK_LAPACKE_H=/usr/include/lapacke.h
    -DOPENCV_GENERATE_PKGCONFIG=ON
    -DOPENCV_ENABLE_NONFREE=ON
    -DOPENCV_JNI_INSTALL_PATH=lib
    -DOPENCV_GENERATE_SETUPVARS=OFF
    -DEIGEN_INCLUDE_PATH=/usr/include/eigen3
    -Dprotobuf_MODULE_COMPATIBLE=ON
    -DHDF5_NO_FIND_PACKAGE_CONFIG_FILE=ON

    -DBUILD_WITH_DEBUG_INFO=ON
  )

  cmake ${cmake_options[@]}
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  local _lib
  for _lib in "$pkgdir/usr/lib/$_pkgname"/libopencv*.so.[0-9]*; do
    ln -sf "$_pkgname/${_lib##*/}" "$pkgdir/usr/lib/${_lib##*/}"
  done

  mv "$pkgdir/usr/lib/$_pkgname/cmake" "$pkgdir/usr/lib/"
  mv "$pkgdir/usr/lib/$_pkgname/pkgconfig" "$pkgdir/usr/lib/"

  rm -r "$pkgdir"/usr/bin/
  rm -r "$pkgdir"/usr/lib/python3*
}
