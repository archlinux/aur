# Maintainer: aur.chaotic.cx

_pkgname="opencv4"
pkgname="$_pkgname"
pkgver=4.13.0
pkgrel=2
pkgdesc="Open Source Computer Vision Library (version 4.x)"
url="https://github.com/opencv/opencv"
license=('Apache-2.0')
arch=('x86_64')

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
  cmake
  eigen
  fast_float
  fmt
  glew
  hdf5
  java-environment
  lapacke
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
  fix-cudacodec-dependencies.patch
  fix-cccl-namespace.patch
  fix-std.patch
  fix-thrust-tuple.patch
)
sha256sums=(
  '1d40ca017ea51c533cf9fd5cbde5b5fe7ae248291ddf2af99d4c17cf8e13017d'
  '1e0077a4fd2960a7d2f4c9e49d6ba7bb891cac2d1be36d7e8e47aa97a9d1039b'
  'f35a2d4ea0d6212c7798659e59eda2cb0b5bc858360f7ce9c696c77d3029668e'
  '95472ecfc2693c606f0dd50be2f012b4d683b7b0a313f51484da4537ab8b2bfe'
  'fbb10b75ca7849f85ea2f118aa017f00e34445d80ed76619f13ae1e4e9504ae4'
  'b757be8df583cb3fa0059e47594eeb680638c572d3ae02bc1a5f7636e71ce5be'
  'c05fe7572ee5193cf3de7f02a500f446f3457ec20c315590a326bf1bfb5552cc'
  '6379b0f23ba4068d2daa43ec158e515f58ef36242138eb10f752a93dc1cec375'
)

# https://gitlab.archlinux.org/archlinux/packaging/packages/kdenlive/-/issues/8
options=('!lto')

prepare() {
  pushd "$_pkgsrc"
  patch -p1 < ../vtk9.patch # Don't require all vtk optdepends
  # https://github.com/opencv/opencv/issues/27223
  # https://bugreports.qt.io/browse/QTBUG-134774
  sed -i 's/add_definitions(${Qt${QT_VERSION_MAJOR}${dt_dep}_DEFINITIONS})/link_libraries(${Qt${QT_VERSION_MAJOR}${dt_dep}})/' modules/highgui/CMakeLists.txt
  # OpenCV passes all CXXFLAGS to nvcc through -Xcompiler, which does not work for '-Wp,something' flags
  # We remove the -Xcompiler and pass our CXXFLAGS through cmake's CUDAFLAGS
  patch -p1 < ../fix-cuda-flags.patch
  popd

  pushd "$_pkgsrc_contrib"
  patch -p1 -i ../fix-cudacodec-dependencies.patch # https://github.com/opencv/opencv_contrib/issues/4045
  patch -p1 -i ../fix-cccl-namespace.patch         # https://github.com/opencv/opencv_contrib/pull/4097
  patch -p1 -i ../fix-std.patch

  # Fix build failure regarding tuple
  patch -p1 -i ../fix-thrust-tuple.patch
}

build() {
  export JAVA_HOME="/usr/lib/jvm/default"
  local cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR="lib/$_pkgname"
    -DCMAKE_CXX_STANDARD=17
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
  for _lib in "$pkgdir/usr/lib/$_pkgname"/libopencv*.so.$pkgver; do
    ln -sf "$_pkgname/${_lib##*/}" "$pkgdir/usr/lib/${_lib##*/}"
  done

  mv "$pkgdir/usr/lib/$_pkgname/pkgconfig" "$pkgdir/usr/lib/"

  rm -r "$pkgdir"/usr/bin/
  rm -r "$pkgdir"/usr/lib/python3*
}
