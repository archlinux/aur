# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=bforartists
pkgver=4.3.2
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (development)"
arch=('i686' 'x86_64')
url="https://bforartists.de/"
depends=(
  'alembic'
  'bash'
  'boost-libs'
  'draco'  # seems to use static lib and should probably only be makedepends
  'embree'
  'expat'
  'ffmpeg'
  'fftw'
  'freetype2'
  'gcc-libs'
  'glew'
  'glibc'
  'gmp'
  'hicolor-icon-theme'
  'imath'
  'intel-oneapi-compiler-dpcpp-cpp-runtime-libs'
  'intel-oneapi-compiler-shared-runtime-libs'
  'jack'  # dlopen'ed
  'jemalloc'
  'level-zero-loader'  # dlopen'ed
  'libepoxy'
  'libharu'
  'libjpeg-turbo'
  'libpng'
  'libsndfile'
  'libspnav'
  'libtiff'
  'libwebp'
  'libx11'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxml2'
  'libxrender'
  'libxxf86vm'
  'llvm-libs'
  'materialx'
  'onetbb'
  'openal'
  'opencolorio'
  'openexr'
  'openimagedenoise'
  'openimageio'
  'openjpeg2'
  'openpgl'
  'openshadinglanguage'
  'opensubdiv'
  'openvdb'
  'openxr'
  'potrace'
  'pugixml'
  'pystring'
  'python'
  'python-numpy'
  'python-requests'
  'sdl2'  # dlopen'ed
  'shared-mime-info'
  'usd'
  'xdg-utils'
  'yaml-cpp'
  'zlib'
  'zstd'
)
makedepends=(
  'boost'
  'cmake'
  'cuda'
  'git'
  'git-lfs'
  'hip-runtime-amd'
  'hiprt'
  'intel-oneapi-compiler-shared-runtime'
  'intel-oneapi-dpcpp-cpp'
  'intel-compute-runtime'
  'level-zero-headers'
  'libdecor'
  'mold'
  'llvm'
  'mesa'
  'ninja'
  'subversion'
  'wayland-protocols'
)
optdepends=('cuda: Cycles renderer CUDA support'
            'intel-compute-runtime: Cycles renderer Intel OneAPI support'
            'hip-runtime-amd: Cycles renderer AMD ROCm support'
            'hiprt: Ray tracing AMD ROCm support'
            'libdecor: wayland support')
# We're using !lto here as otherwise we get stuff such as FS#77557
options=('!lto')

provides=('bforartists')
conflicts=('bforartists')
license=('GPL')
# NOTE: the source array has to be kept in sync with .gitmodules
# the submodules has to be stored in path ending with git to match
# the path in .gitmodules.
# More info:
#   http://wiki.blender.org/index.php/Dev:Doc/Tools/Git
source=("https://github.com/Bforartists/Bforartists/archive/refs/tags/v$pkgver.tar.gz"
        https://developer.download.nvidia.com/redist/optix/v8.0/OptiX-8.0-Include.zip
        )

sha512sums=('8280481c9c8241aa716a37e6c3b47ace25cf21c4bde1e9eb6eda92c7ba6665fc6f49f260c63e938ae730e351c4bcf716de98d52dd529650c9dd1c6e5634a4b8b'
            '5502d9df847de12badc702c0444bd4f1f7620460b2235026df2c3133da1e04c148af0f1fc7f345e9a0c009c32f905f66c8d427743445e8864d3a797cdce6a483'
)

prepare() {
  cd "$srcdir/Bforartists-$pkgver"
  # update the submodules
  git submodule update --init --recursive --remote
}

_get_pyver() {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}


build() {
  export CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}

  local cmake_options=(
    -B build
    -C "Bforartists-$pkgver/build_files/cmake/config/blender_release.cmake"
    -C "$srcdir/precache"
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D WITH_LINKER_MOLD=ON
    -D CUDA_HOST_COMPILER="$NVCC_CCBIN"
    -D HIP_ROOT_DIR=/opt/rocm
    -D WITH_CYCLES_HIP_BIANRIES=ON
    -D WITH_CYCLES_DEVICE_HIPRT=ON
    -D HIPRT_INCLUDE_DIR=/opt/rocm/include
    -D HIP_LINKER_EXECUTABLE=/opt/rocm/lib/llvm/bin/clang++
    -D OCLOC_INSTALL_DIR=/usr
    -D OPTIX_ROOT_DIR="$srcdir"
    -D PYTHON_VERSION="$(_get_pyver)"
    # -D SYCL_CPP_FLAGS=--verbose  # for debugging
    -D SYCL_ROOT_DIR=/opt/intel/oneapi/compiler/latest
    -D SYCL_OFFLINE_COMPILER_PARALLEL_JOBS=8
    -D USD_ROOT_DIR=/usr
    -D WITH_CYCLES_OSL=ON
    -D WITH_INSTALL_PORTABLE=OFF
    -D WITH_PYTHON_INSTALL=OFF
    -G Ninja
    -S "Bforartists-$pkgver"
    -W no-dev
  )

  # CUDA arch 90 is unsupported
  echo 'set(CYCLES_CUDA_BINARIES_ARCH sm_52 sm_53 sm_60 sm_61 sm_62 sm_70 sm_72 sm_75 sm_80 sm_86 sm_87 sm_89 compute_89 CACHE STRING "CUDA architectures to build binaries for" FORCE)' > precache
  echo 'mark_as_advanced(CYCLES_CUDA_BINARIES_ARCH)' >> precache

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # Move OneAPI AOT lib to proper place
  mv "${pkgdir}"/usr/share/bforartists/lib/libcycles_kernel_oneapi_aot.so "${pkgdir}"/usr/lib/
}
