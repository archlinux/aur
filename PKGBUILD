# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
# Co-Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Started by https://github.com/qumaciel at https://github.com/PixarAnimationStudios/USD/issues/2000

# WARNING This USD build is not intended for building Blender.

_tbbmajorver=2019
_tbbpkgminorver=6

pkgname=usd
pkgver=23.05
pkgrel=6
pkgdesc='3D VFX pipeline interchange file format'
arch=(x86_64)
url='https://openusd.org'
_url='https://github.com/PixarAnimationStudios/USD'
license=('Apache')
depends=(glew
         jemalloc
         doxygen
         graphviz
         openexr
         opensubdiv
         pyside6
         python-opengl
         qt5-base)
makedepends=(cmake
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
optdepends=('materialx: MaterialX Support'
            'embree: Embree Support')
options=(!lto)

# git+$_url.git#branch=dev TEST
source=("git+$_url.git#tag=v$pkgver"
        "https://github.com/oneapi-src/oneTBB/archive/refs/tags/${_tbbmajorver}_U${_tbbpkgminorver}.tar.gz"
        "https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz"
        "tbbgcc13.patch"
        "pyside6.patch"
        "materialx.patch"
        "memset.patch"
        )
sha512sums=('SKIP'
            '6bcc014ec90cd62293811ac436eab03c7f7c7e3e03109efcab1c42cfed48d8bf83073d03ab381e5e63ee8c905f1792a7fdab272ec7e585df14102bad714ffc15'
            '6ab652c77dddc5a69cfc3f09974ba66f1413d699e49734c7ed31c629f5368230e0adaf95f599eafbf9316660d67b0b011b52ac1552d814564cbb2967bd927fdd'
            'e9d4d37b6243b32dc4dbf1ab8b5b1c6a2ceb87a81b7ac711afd95244131ac5305e2369b93581c4670ca15f8cdc42482a8cd373e22779322d52e66e2a5ecdf08b'
            'ba35f847b023139dcc3b38ec9308d52c7358967f22c38d481a0a9d9fee1ced674b56850bc9f7e07c350a144c1e575ec1f77a1a0b970dc4ceddcae904d6bc403f'
            '167e9bb2bced935cd9513b4ecd40c9e73ada0c794f1e5f11dc3e2844bedc07ac082aa8fb88e50c86dc2c80854ed95ddc22472f6fdc978765398079164d1c15c5'
            'SKIP')

prepare() {
  patch --directory=USD --forward --strip=1 --input="${srcdir}/pyside6.patch"
  patch --directory=USD --forward --strip=1 --input="${srcdir}/materialx.patch"
  #TBB
  mkdir -p "${srcdir}"/tbb2019
  patch --directory=oneTBB-${_tbbmajorver}_U${_tbbpkgminorver} --forward --strip=1 --input="${srcdir}/tbbgcc13.patch"
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
    -DPXR_BUILD_DOCUMENTATION=ON
    -DBOOST_ROOT="${srcdir}"/boost
    -DTBB_ROOT_DIR="${srcdir}"/tbb2019/usr
    -DBoost_NO_BOOST_CMAKE=ON
    -DBUILD_SHARED_LIBS=ON
    -DPXR_MALLOC_LIBRARY:path=/usr/lib/libjemalloc.so
    -DPYSIDEUICBINARY=/usr/bin/uic
    -DPXR_VALIDATE_GENERATED_CODE=ON
  )

  # Optional components support

  if [[ -d /usr/materialx ]]; then
    _CMAKE_FLAGS+=(
    -DPXR_ENABLE_MATERIALX_SUPPORT=TRUE
    -DMaterialX_ROOT=/usr/materialx
    )
  fi

  if [[ -d /usr/include/embree4 ]]; then
    _CMAKE_FLAGS+=(-DPXR_BUILD_EMBREE_PLUGIN=ON)
  fi

  if [[ -d /usr/include/Alembic ]]; then
    _CMAKE_FLAGS+=(-DPXR_BUILD_ALEMBIC_PLUGIN=ON)
  fi

  if [[ -d /usr/include/OSL ]]; then
    _CMAKE_FLAGS+=(-DPXR_ENABLE_OSL_SUPPORT=ON)
  fi

  if [[ -d /usr/include/draco ]]; then
    _CMAKE_FLAGS+=(-DPXR_BUILD_DRACO_PLUGIN=ON)
  fi

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
