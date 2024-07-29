# Maintainer: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgbase=opencv-dev
pkgname=("$pkgbase"
         "$pkgbase-samples"
         "python-$pkgbase")
pkgver=4.10.0
pkgrel=3
pkgdesc='Open Source Computer Vision Library'
arch=(x86_64)
license=(Apache-2.0)
url='https://opencv.org/'

depends=(abseil-cpp
         cblas
         ffmpeg
         freetype2
         llvm-libs
         glib2
         glibc
         gst-plugins-base
         gst-plugins-base-libs
         gstreamer
         harfbuzz
         lapack
         libdc1394
         libglvnd
         libjpeg-turbo
         libpng
         libtiff
         libwebp
         openexr
         openjpeg2
         verdict
         protobuf
         tbb
         zlib)

makedepends=(ant
             cmake
             eigen
             fmt
             clang
             ccache
             git
             glew
             hdf5
             java-environment
             lapacke
             mesa
             nlohmann-json
             openmpi
             pugixml
             python-numpy
             python-setuptools
             qt6-5compat
             vtk)

optdepends=("$pkgbase-samples: samples"
            'vtk: for the viz module'
            'glew: for the viz module'
            'qt6-base: for the HighGUI module'
            'hdf5: for the HDF5 module'
            'opencl-icd-loader: For coding with OpenCL'
            'java-runtime: Java interface')
source=(git+https://github.com/opencv/opencv#tag=$pkgver
        git+https://github.com/opencv/opencv_contrib#tag=$pkgver
        vtk9.patch)
sha256sums=('3882d3fdbd782983dcab19cada16a9206165d153bc5528f9007a48f27e52dc68'
            '24f040b420d63566aeb77191706ff08b446698adf13a715d1f3cc6b60d5c7c5b'
            'f35a2d4ea0d6212c7798659e59eda2cb0b5bc858360f7ce9c696c77d3029668e')

prepare() {
  ##
  pushd opencv
  patch -p1 < ../vtk9.patch # Don't require all vtk optdepends

  # # fix build with cudnn 9
  # git cherry-pick -n 05e48605a0aea00d3a89b9ab5e25cdf89568aa28
  # # fix build with CUDA 12.4
  # git cherry-pick -n 1668203a1c6474b8368e27c55abc10ae7f17c841
  # popd

  # pushd opencv_contrib
  # # fix build with CUDA 12.4
  # git cherry-pick -n 4e766a039eda04b75f28f6905e4192d99b7874c7
  # git cherry-pick -n 1ed3dd2c53888e3289afdb22ec4e9ebbff3dba87
  # git cherry-pick -n 8c16a489a1fa9e2ccf21ce8eeb7fbb1affe548b1
}

build() {
  export JAVA_HOME="/usr/lib/jvm/default"
  # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
  _cmakeopts="-DWITH_OPENCL=ON \
  -DWITH_OPENGL=ON \
  -DOpenGL_GL_PREFERENCE=LEGACY \
  -DCMAKE_CXX_STANDARD=17 \
  -DWITH_TBB=ON \
  -DWITH_VULKAN=ON \
  -DWITH_QT=ON \
  -DWITH_WAYLAND=ON \
  -DQt6WaylandClient_DIR=/usr/lib/cmake/Qt6WaylandClient \
  -DQt6WaylandCompositor_DIR=/usr/lib/cmake/Qt6WaylandCompositor \
  -DHIGHGUI_ENABLE_PLUGINS=ON \
  -DHIGHGUI_PLUGIN_LIST=gtk,gtk2,gtk3,qt \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DBUILD_EXAMPLES=ON \
  -DBUILD_PROTOBUF=OFF \
  -DPROTOBUF_UPDATE_FILES=ON \
  -DINSTALL_C_EXAMPLES=ON \
  -DINSTALL_PYTHON_EXAMPLES=ON \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DOPENCV_EXTRA_MODULES_PATH=$srcdir/opencv_contrib/modules \
  -DOPENCV_SKIP_PYTHON_LOADER=ON \
  -DLAPACK_LIBRARIES=/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so \
  -DLAPACK_CBLAS_H=/usr/include/cblas.h \
  -DLAPACK_LAPACKE_H=/usr/include/lapacke.h \
  -DOPENCV_GENERATE_PKGCONFIG=ON \
  -DOPENCV_ENABLE_NONFREE=ON \
  -DOPENCV_JNI_INSTALL_PATH=lib \
  -DOPENCV_GENERATE_SETUPVARS=OFF \
  -DEIGEN_INCLUDE_PATH=/usr/include/eigen3 \
  -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
  -Dprotobuf_MODULE_COMPATIBLE=ON \
  -DOPENCV_ENABLE_NOFREE=ON \
  -DCMAKE_C_COMPILER_LAUNCHER=/usr/bin/ccache \
  -DCMAKE_CXX_COMPILER_LAUNCHER=/usr/bin/ccache \
  -DCMAKE_C_COMPILER=/usr/bin/clang \
  -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
  -DCMAKE_LINKER=/usr/bin/lld \
  -DCMAKE_AR=/usr/bin/llvm-ar \
  -DCMAKE_ASM_COMPILER=/usr/bin/llvm-as \
  -DCMAKE_RANLIB=/usr/bin/llvm-ranlib \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_WITH_DEBUG_INFO=ON"

  # -DQt6_DIR=/usr/lib/cmake/Qt6 \  # included

  # -DBUILD_WITH_DEBUG_INFO=OFF"
  # -DBUILD_WITH_DEBUG_INFO=OFF"  # def off better..
  # -
  # -DCMAKE_C_COMPILER_LAUNCHER=ccache \
  # -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \

  # -DCMAKE_LINKER_TYPE=LLD \

  ##
  ## -DCMAKE_INSTALL_LIBDIR=lib \

  # -DCPU_BASELINE_REQUIRE=SSE2 \
  # -DCPU_BASELINE_DISABLE=SSE3 \

  # export LD=lld
  # export CC="ccache clang"
  # export CXX="ccache clang++"
  # export AR="ccache llvm-ar"
  # export AS="ccache llvm-as"
  # export RANLIB=llvm-ranlib
 
  cmake -B build -S opencv $_cmakeopts

  cmake --build build -j $(nproc)

  # CFLAGS="${CFLAGS} -fno-lto" CXXFLAGS="${CXXFLAGS} -fno-lto" LDFLAGS="${LDFLAGS} -fno-lto"
}

package_opencv-dev() {
  provides=(opencv)
  conflicts=(opencv)

  DESTDIR="$pkgdir" cmake --install build

  # separate samples package
  mv "$pkgdir"/usr/share/opencv4/samples "$srcdir"

  # Add java symlinks expected by some binary blobs
  ln -sr "$pkgdir"/usr/share/java/{opencv4/opencv-${pkgver//./},opencv}.jar
  ln -sr "$pkgdir"/usr/lib/{libopencv_java${pkgver//./},libopencv_java}.so

  # Split Python bindings
  rm -r "$pkgdir"/usr/lib/python3*
}

package_opencv-dev-samples() {
  pkgdesc+=' (samples)'
  depends=("$pkgbase")
  unset optdepends

  provides=(opencv-samples)
  conflicts=(opencv-samples)

  mkdir -p "$pkgdir"/usr/share/opencv4
  mv samples "$pkgdir"/usr/share/opencv4
}

package_python-opencv-dev() {
  pkgdesc='Python bindings for OpenCV'
  depends=(fmt
           glew
           hdf5
           jsoncpp
           "$pkgbase"
           openmpi
           pugixml
           python-numpy
           qt6-base
           vtk)
  unset optdepends

  provides=(python-opencv)
  conflicts=(python-opencv)

  DESTDIR="$pkgdir" cmake --install build/modules/python3
}
