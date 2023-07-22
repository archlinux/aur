# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
# Co-Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Started by https://github.com/qumaciel at https://github.com/PixarAnimationStudios/USD/issues/2000

# WARNING This USD build is not intended for building Blender.

_tbbmajorver=2019
_tbbpkgminorver=6

pkgname=usd
pkgver=23.08
pkgrel=1
pkgdesc='3D VFX pipeline interchange file format'
arch=(x86_64)
url='https://openusd.org'
_url='https://github.com/PixarAnimationStudios/USD'
license=('Apache')
depends=(glew
         boost
         jemalloc
         doxygen
         graphviz
         openexr
         opensubdiv
         pyside2
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
        "usd.sh"
        )
sha512sums=('SKIP'
            '6bcc014ec90cd62293811ac436eab03c7f7c7e3e03109efcab1c42cfed48d8bf83073d03ab381e5e63ee8c905f1792a7fdab272ec7e585df14102bad714ffc15'
            '8094b0238f320044f939917cde3ff3541bfffbd65daa7848626ca4ad930635fe64c78cbdef1ee3469134b14068a12416542ac263d8115fa27e0ad70fa20a7ecd')

prepare() {
  cd ${srcdir}

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
}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/usr/share/usd
    -DCMAKE_PREFIX_PATH:PATH=/usr/share/usd
    -DPXR_BUILD_TESTS=ON
    -DPXR_BUILD_DOCUMENTATION=ON
    -DBOOST_ROOT=/usr
    -DTBB_ROOT_DIR="${srcdir}"/tbb2019/usr
    -DBoost_NO_BOOST_CMAKE=ON
    -DBUILD_SHARED_LIBS=ON
    -DPXR_MALLOC_LIBRARY:path=/usr/lib/libjemalloc.so
    -DPYSIDEUICBINARY=/usr/bin/uic
    -DPXR_VALIDATE_GENERATED_CODE=ON
  )

  # Optional components support

  if [[ -d /opt/materialx ]]; then
    _CMAKE_FLAGS+=(
    -DPXR_ENABLE_MATERIALX_SUPPORT=TRUE
    -DMaterialX_ROOT=/opt/materialx
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

  install -Dm755 "${srcdir}"/usd.sh "${pkgdir}"/etc/profile.d/usd.sh
  cp -r "${srcdir}"/tbb2019/usr/* "${pkgdir}"/usr/share/usd
}
