# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Started by https://github.com/qumaciel at https://github.com/PixarAnimationStudios/USD/issues/2000

# WARNING This USD build is not intended for building Blender.

_tbbmajorver=2019
_tbbpkgminorver=6

pkgname=usd
pkgver=23.05
pkgrel=2
pkgdesc='3D VFX pipeline interchange file format'
arch=(x86_64)
url='https://openusd.org'
_url='https://github.com/PixarAnimationStudios/USD'
license=('Apache')
depends=(boost-libs
         glew
         jemalloc
         openexr
         opensubdiv
         pyside2
         pyside6
         python-opengl)
makedepends=(cmake
             cuda
             doxygen
             git
             glew
             glfw
             inetutils
             ninja
             opencl-headers
             python
             python-docutils
             python-jinja
             python-pygments)
options=(!lto)

# git+$_url.git#branch=dev TEST
source=("git+$_url.git#tag=v$pkgver"
        "https://github.com/oneapi-src/oneTBB/archive/refs/tags/${_tbbmajorver}_U${_tbbpkgminorver}.tar.gz"
        "https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz"
        )
sha512sums=('SKIP'
            '6bcc014ec90cd62293811ac436eab03c7f7c7e3e03109efcab1c42cfed48d8bf83073d03ab381e5e63ee8c905f1792a7fdab272ec7e585df14102bad714ffc15'
            '6ab652c77dddc5a69cfc3f09974ba66f1413d699e49734c7ed31c629f5368230e0adaf95f599eafbf9316660d67b0b011b52ac1552d814564cbb2967bd927fdd')

prepare() {
  #TBB
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

  #BOOST
  cd ${srcdir}/boost_1_78_0

  ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=python3
  ./b2 install \
  \
  --prefix="$srcdir"/boost
}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/usr/share/usd
    -DPXR_BUILD_TESTS=ON
    -DBOOST_ROOT="${srcdir}"/boost
    -DTBB_ROOT_DIR="${srcdir}"/tbb2019/usr
    -DBoost_NO_BOOST_CMAKE=ON
    -DBUILD_SHARED_LIBS=ON
    -DPXR_MALLOC_LIBRARY:path=/usr/lib/libjemalloc.so
    -DPXR_VALIDATE_GENERATED_CODE=ON
  )
  export CXXFLAGS+=" -DBOOST_BIND_GLOBAL_PLACEHOLDERS"
  cmake -S USD -B build -G Ninja "${_CMAKE_FLAGS[@]}"

  ninja -C build ${MAKEFLAGS:--j12}
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  mkdir -p $pkgdir/usr/bin
  ln -s "/usr/share/usd/bin/usdview" "$pkgdir/usr/bin/usdview"

  echo ""
  echo "----------------------------------------------"
  echo "To launch usdview use this env vars:"
  echo "PATH       /lib:/usr/usd/share/bin"
  echo "PYTHONPATH /usr/usd/share/lib/python"
  echo "LD_PRELOAD /usr/lib/libjemalloc.so (Optional)"
  echo "----------------------------------------------"
}
