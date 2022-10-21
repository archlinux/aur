# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
# Contributor: Started by https://github.com/qumaciel at https://github.com/PixarAnimationStudios/USD/issues/2000

# WARNING This USD build is not intended for building Blender.

_tbbmajorver=2019
_tbbpkgminorver=6
_opensubdivver=3.4.4
_ver="v22.11"
_fragment="#tag=$_ver"

pkgname=usd
pkgver=${_ver#v}
pkgrel=1
pkgdesc="3D VFX pipeline interchange file format."
arch=('x86_64')
url="https://graphics.pixar.com/usd/docs/index.html"
license=('Apache')
depends+=('boost-libs' 'glew' 'openexr' 'python-opengl' 'pyside6' 'pyside2')
makedepends+=('boost' 'cmake' 'git' 'ninja' 'python-jinja' 'inetutils' 'doxygen' 'glfw' 'glew' 'python' 'python-pygments' 'python-docutils' 'opencl-headers' 'cuda')
provides=("usd=${pkgver}")
conflicts=("usd")
source=("git+https://github.com/PixarAnimationStudios/USD.git${_fragment}"
        https://github.com/oneapi-src/oneTBB/archive/refs/tags/${_tbbmajorver}_U${_tbbpkgminorver}.tar.gz
        "https://github.com/PixarAnimationStudios/OpenSubdiv/archive/v${_opensubdivver//./_}.tar.gz"
        )
sha512sums=('SKIP'
            '6bcc014ec90cd62293811ac436eab03c7f7c7e3e03109efcab1c42cfed48d8bf83073d03ab381e5e63ee8c905f1792a7fdab272ec7e585df14102bad714ffc15'
            'fc8f28b79347015c8991150535c1339e695d96947c72fadd4fa27b546a0813c1125cd175ee03bed5aacdb3609f74c4e526ef70103d1195ba9f7df041e73ea9fb'
            )
options=(!lto)






prepare() {

  ############################
  #       TBB 2019.6         #
  ############################

  # USD is built against tbb 2019 update 6 and it is broken with current 2021.6.0
  mkdir -p "${srcdir}"/tbb2019
  cd oneTBB-${_tbbmajorver}_U${_tbbpkgminorver}
  make
  install -Dm755 build/linux_*/*.so* -t "${srcdir}"/tbb2019/usr/lib
  install -d "${srcdir}"/tbb2019/usr/include
  cp -a include/tbb "${srcdir}"/tbb2019/usr/include
  cmake \
    -DINSTALL_DIR="${srcdir}"/tbb2019/usr/lib/cmake/TBB \
    -DSYSTEM_NAME=Linux \
    -DTBB_VERSION_FILE="${srcdir}"/tbb2019/usr/include/tbb/tbb_stddef.h \
    -P cmake/tbb_config_installer.cmake

  ############################
  #     opensubdiv 3.4.4     #
  ############################
  # opensubdiv also depends on tbb and the upstream package is patched to work
  # with tbb2021, so we need to rebuild targeting tbb2019 to build
  # usd with -DPXR_BUILD_MONOLITHIC
  mkdir -p "${srcdir}"/opensubdiv344
  cd "${srcdir}"/"OpenSubdiv-${_opensubdivver//./_}"

  mkdir -p build
  cd build

  mkdir -p CMakeFiles/osd_static_gpu.dir/osd

  cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DTBB_LOCATION="${srcdir}"/tbb2019/usr \
      -DOSD_CUDA_NVCC_FLAGS='--gpu-architecture=compute_53' \
      -DCUDA_HOST_COMPILER=/usr/bin/g++ \
      -DCMAKE_INSTALL_PREFIX="${srcdir}"/opensubdiv344/usr

  make
  make install

}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/usr/usd
    -DPXR_BUILD_TESTS=ON
    -DTBB_ROOT_DIR="${srcdir}"/tbb2019/usr
    -DOPENSUBDIV_ROOT_DIR="${srcdir}"/opensubdiv344/usr
    -DBoost_NO_BOOST_CMAKE=ON
    -DPXR_USE_PYTHON_3=ON
    -DBUILD_SHARED_LIBS=ON
    -DPXR_MALLOC_LIBRARY:path=/usr/lib/libjemalloc.so
    -DPXR_VALIDATE_GENERATED_CODE=OFF
  )
  export CXXFLAGS+=" -DBOOST_BIND_GLOBAL_PLACEHOLDERS"
  cmake -S USD -B build -G Ninja "${_CMAKE_FLAGS[@]}"

  LD_PRELOAD=/usr/lib/libjemalloc.so ninja -C build ${MAKEFLAGS:--j12}
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  mkdir -p $pkgdir/usr/bin
  ln -s "/usr/usd/bin/usdview" "$pkgdir/usr/bin/usdview"

  echo ""
  echo "----------------------------------------------"
  echo "To launch usdview use this env vars:"
  echo "PATH       /lib:/usr/usd/bin"
  echo "PYTHONPATH /usr/usd/lib/python"
  echo "LD_PRELOAD /usr/lib/libjemalloc.so (Optional)"
  echo "----------------------------------------------"
}
