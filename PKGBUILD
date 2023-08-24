# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
# Co-Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Started by https://github.com/qumaciel at https://github.com/PixarAnimationStudios/USD/issues/2000

pkgname=usd
pkgver=23.08
pkgrel=4
pkgdesc='3D VFX pipeline interchange file format'
arch=(x86_64)
url='https://openusd.org'
_url='https://github.com/PixarAnimationStudios/OpenUSD'
license=('Apache')
depends=(glew
         boost
         jemalloc
         doxygen
         graphviz
         openexr
         opencolorio
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
            'embree: Embree Support'
            'alembic: Alembic Support'
            'openshadinglanguage: OSL Support'
            'draco: Draco Support')

options=(!lto)

# git+$_url.git#branch=dev TEST
source=("git+$_url.git#tag=v$pkgver"
        "usd.patch"
        "usd.sh"
        )
sha512sums=('SKIP'
            '8d12b300aab294657c5074d6dd15727eefaac4fde5aaaa9a254fe47aa6f17204a124efad069904c3bafdc1d691cfadce2bebcc2cc21cb6fe3e109043d06e9545'
            '8094b0238f320044f939917cde3ff3541bfffbd65daa7848626ca4ad930635fe64c78cbdef1ee3469134b14068a12416542ac263d8115fa27e0ad70fa20a7ecd')

prepare() {
  patch --directory="${srcdir}/OpenUSD" --forward --strip=1 --input="${srcdir}/usd.patch" # Support for tbb 2021 and build fixes
}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/usr/share/usd
    -DCMAKE_PREFIX_PATH:PATH=/usr/share/usd
    -DPXR_BUILD_TESTS=OFF
    -DPXR_BUILD_DOCUMENTATION=ON
    -DBoost_NO_BOOST_CMAKE=ON
    -DBUILD_SHARED_LIBS=ON
    -DPXR_MALLOC_LIBRARY:path=/usr/lib/libjemalloc.so
    -DPYSIDEUICBINARY=/usr/bin/uic
    -DPXR_VALIDATE_GENERATED_CODE=ON
  )

  ## Optional components support ##
  # This will be replaced with package splitting in the feature

  if [[ -d /opt/materialx ]]; then
    _CMAKE_FLAGS+=(
    -DPXR_ENABLE_MATERIALX_SUPPORT=TRUE
    -DMaterialX_ROOT=/opt/materialx
    )
  fi

  if [[ -d /usr/include/embree4 ]]; then
    _CMAKE_FLAGS+=(-DPXR_BUILD_EMBREE_PLUGIN=ON)
  fi

  if [[ -d /usr/include/embree3 ]]; then
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
  cmake -S OpenUSD -B build -G Ninja "${_CMAKE_FLAGS[@]}"

  ninja -C build ${MAKEFLAGS:--j12}
}

package() {
  DESTDIR="$pkgdir" ninja -C build install # Installing to /usr/share/usd, this may be changed in the future

  install -Dm755 "${srcdir}"/usd.sh "${pkgdir}"/etc/profile.d/usd.sh # Add env vars
}
