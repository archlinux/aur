#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration.
_fragment=${FRAGMENT:-#branch=main}
_git_revert=(49414a72f607ccd15f8b71b81edc9aff040d581e)
# Use CMAKE_FLAGS=xxx:yyy:zzz to define extra CMake flags
[[ -v CMAKE_FLAGS ]] && mapfile -t -d: CMAKE_FLAGS < <(echo -n "$CMAKE_FLAGS")
# shellcheck disable=SC2206
[[ -v CUDA_ARCH ]] && _CMAKE_FLAGS+=("-DCYCLES_CUDA_BINARIES_ARCH=${CUDA_ARCH}")
[[ -v HIP_ARCH  ]] && _CMAKE_FLAGS+=("-DCYCLES_HIP_BINARIES_ARCH=${HIP_ARCH}")

#some extra, unofficially supported stuff goes here:
((TRAVIS)) && _cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75) # Travis memory limit is not enough to build for arch 3.x.
((DISABLE_USD)) && {
  _CMAKE_FLAGS+=( -DWITH_USD=OFF )
} || {
  _CMAKE_FLAGS+=( -DWITH_USD=ON
                  -DUSD_ROOT=/usr )
  depends+=( "usd>=23.11" )
}
((DISABLE_MATERIALX)) && {
  _CMAKE_FLAGS+=( -DWITH_MATERIALX=OFF )
} || {
  _CMAKE_FLAGS+=( -DWITH_MATERIALX=ON )
  depends+=( materialx )
}
((DISABLE_NINJA)) || { makedepends+=('ninja'); : ${MAKEFLAGS:--j1}; }
#shellcheck disable=SC2015
((DISABLE_CUDA)) && { 
  optdepends+=('cuda: CUDA support in Cycles') 
  _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_CUDA=OFF
                  -DWITH_CYCLES_CUDA_BINARIES=OFF
                  -DWITH_CYCLES_DEVICE_OPTIX=OFF
                  -DWITH_CUDA_DYNLOAD=ON )
} || {
  makedepends+=('cuda')
  _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON
                  -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
  ((DISABLE_OPTIX)) && {
    _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_OPTIX=OFF )
  } || {
    _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_OPTIX=ON
                    -DOPTIX_ROOT_DIR=/opt/optix )
    makedepends+=('optix>=8.0')
  }
}
((DISABLE_HIP)) && {
  _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_HIP{,RT}=OFF
                  -DWITH_CYCLES_HIP_BINARIES=OFF
                  -DWITH_HIP_DYNLOAD=ON )
} || {
  makedepends+=('hip-runtime-amd' 'hiprt')
  optdepends+=('hip-runtime-amd: Cycles renderer AMD ROCm support'
               'hiprt: Ray tracing AMD ROCm support')
  _CMAKE_FLAGS+=( -DHIP_ROOT_DIR=/opt/rocm
                  -DHIPRT_INCLUDE_DIR=/opt/rocm/include
                  -DHIPRT_COMPILER_PARALLEL_JOBS="$(nproc)" )
}
((DISABLE_ONEAPI)) && {
  _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_ONEAPI=OFF
                  -DWITH_CYCLES_ONEAPI_BINARIES=OFF )
} || {
  makedepends+=('intel-oneapi-compiler-shared-runtime'
                'intel-oneapi-dpcpp-cpp'
                'intel-compute-runtime'
                'level-zero-headers' )
  optdepends+=('intel-compute-runtime: Cycles renderer Intel OneAPI support')
  _CMAKE_FLAGS+=( -DOCLOC_INSTALL_DIR=/usr
                  -DSYCL_CPP_FLAGS="--verbose"  # for debugging
                  -DSYCL_ROOT_DIR=/opt/intel/oneapi/compiler/latest
                  -DSYCL_OFFLINE_COMPILER_PARALLEL_JOBS=8 )
}

((ENABLE_PYTHON_INSTALL)) && \
  _CMAKE_FLAGS+=( -DWITH_PYTHON_INSTALL=ON ) || \
  _CMAKE_FLAGS+=( -DWITH_PYTHON_INSTALL=OFF )

pkgname=blender-develop-git
pkgver=5.2.r160926.g54ebd89a64c
pkgrel=1
pkgdesc="Development version of Blender (non-conflicting version)"
changelog=blender.changelog
arch=('i686' 'x86_64')
url="https://blender.org/"
depends+=('alembic' 'ceres-solver' 'eigen' 'embree' 'libgl' 'python' python-{numpy,requests} 'openjpeg2' 'libharu' 'potrace' 'openxr'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')
depends+=('openimagedenoise')
depends+=('libdecor' 'libepoxy')
depends+=('openpgl')
depends+=('shaderc')
depends+=('manifold')
makedepends+=('git' 'git-lfs' 'cmake' 'clang' 'boost' 'mesa' 'llvm' 'mold' 'patchelf' wayland{,-protocols} 'vulkan-headers' 'libxkbcommon')
makedepends+=('wayland-protocols')
makedepends+=('cython')
provides=("blender=${pkgver%%.r*}")
conflicts=("blender=${pkgver%%.r*}")
license=('GPL')
# NOTE: the source array has to be kept in sync with .gitmodules
# the submodules has to be stored in path ending with git to match
# the path in .gitmodules.
# More info:
#   http://wiki.blender.org/index.php/Dev:Doc/Tools/Git
source=("blender::git+https://github.com/blender/blender${_fragment}"
        SelectCudaComputeArch.patch
        blender-fix-oneapi-2026.patch::https://raw.githubusercontent.com/intel/llvm/20a7095cba72ace59f7c8a64711ec4b51f01f030/devops/actions/blender/blender-build/patches/Fix-build.patch
        )
sha256sums=('SKIP'
            '60ac315c873a3842dd46393ed351c008255911a8fa352d39587a5eede3983e3a'
            '154d89a0187476265f3d29fbc3ec696c0e293e27f75a4c633ea81393ab9a1ae2')

pkgver() {
  blender_version=$(grep -Po "BLENDER_VERSION \K[0-9]{3}" "$srcdir"/blender/source/blender/blenkernel/BKE_blender_version.h)
  printf "%d.%d.r%s.g%s" \
    $((blender_version/100)) \
    $((blender_version%100)) \
    "$(git -C "$srcdir/blender" rev-list --count HEAD)" \
    "$(git -C "$srcdir/blender" rev-parse --short HEAD)"
}

prepare() {
  # fetch git-lfs assets
  make V=1 -C "$srcdir/blender" update_code
  if [ ! -v CUDA_ARCH ] && ((! DISABLE_CUDA)) && grep -q nvidia <(lsmod); then
    git -C "$srcdir/blender" apply -v "${srcdir}"/SelectCudaComputeArch.patch
  fi
  [[ -v _git_revert ]] && git -C "${srcdir}"/blender revert --no-commit -Xtheirs "${_git_revert[@]}" || git -C "${srcdir}"/blender revert --abort
# remove deprecated headers in rocm:7
  sed -e '/Geometry.h/d' -e '/Scene.h/d' -i "$srcdir"/blender/intern/cycles/kernel/CMakeLists.txt
# fix build agaisnt oneapi:2026.0.0
  git -C "$srcdir/blender" apply -v "${srcdir}"/blender-fix-oneapi-2026.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  ((DISABLE_CUDA)) || {
    [ -f "/usr/lib/ccache/bin/nvcc-ccache" ] && export CUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache
    if _cuda_gcc=$(basename "${NVCC_CCBIN}") ; then
      if [ -L "/usr/lib/ccache/bin/$_cuda_gcc" ]
        then export CUDAHOSTCXX=/usr/lib/ccache/bin/"$_cuda_gcc"
        else export CUDAHOSTCXX="$_cuda_gcc"
      fi
    fi
  }

  ((DISABLE_NINJA)) && generator="Unix Makefiles" || generator="Ninja"
  cmake -G "$generator" -S "$srcdir/blender" -B "$srcdir/build" \
        -C "${srcdir}/blender/build_files/cmake/config/blender_release.cmake" \
        -DWITH_LINKER_MOLD=ON \
        -DWITH_CYCLES_OSL=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DXR_OPENXR_SDK_ROOT_DIR=/usr \
        -DPYTHON_VERSION="${_pyver}" \
        "${_CMAKE_FLAGS[@]}"
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps | %W] "
# shellcheck disable=SC2086 # allow MAKEFLAGS to split when multiple flags provided.
  cmake --build build ${MAKEFLAGS}
}

package() {
  _suffix=${pkgver%%.r*}
  _pyver=$(python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))')
  sed -i "/BLENDER_BIN/s|\(/usr/bin/blender\)|${pkgdir}\1|" "${srcdir}"/build/source/creator/cmake_install.cmake
  cmake --install build --prefix "${pkgdir}/usr" -v
  python -m compileall "${pkgdir}/usr/share/blender"
  python -O -m compileall "${pkgdir}/usr/share/blender"


  # patch blender runpath for the OneAPI AOT lib actual location
  patchelf --set-rpath '$ORIGIN/../share/blender/lib/' ${pkgdir}/usr/bin/blender

    msg "add -${_suffix} suffix to desktop shortcut"
    sed -i "s/=blender/=blender-${_suffix}/g" "${pkgdir}/usr/share/applications/blender.desktop"
    sed -i "s/=Blender/=Blender-${_suffix}/g" "${pkgdir}/usr/share/applications/blender.desktop"
    mv "${pkgdir}/usr/share/applications/blender.desktop" "${pkgdir}/usr/share/applications/blender-${_suffix}.desktop"

    msg "add -${_suffix} suffix to binaries"
    mv "${pkgdir}/usr/bin/blender" "${pkgdir}/usr/bin/blender-${_suffix}"
    mv "${pkgdir}/usr/bin/blender-thumbnailer" "${pkgdir}/usr/bin/blender-${_suffix}-thumbnailer"

    msg "mv doc/blender to doc/blender-${_suffix}"
    mv "${pkgdir}/usr/share/doc/blender" "${pkgdir}/usr/share/doc/blender-${_suffix}" || true

    msg "add -${_suffix} suffix to man page"
    mv "${pkgdir}/usr/share/man/man1/blender.1" "${pkgdir}/usr/share/man/man1/blender-${_suffix}.1" || true

    msg "add -${_suffix} suffix to all icons"
    while read -r icon
    do
      # ${filename##/*.} extra extenssion from path
      # ${filename%.*} extract filename form path
      # look at bash "manipulatin string"
      mv "$icon" "${icon%.*}-${_suffix}.${icon##/*.}"
    done < <(find "${pkgdir}/usr/share/icons" -type f)

    msg "add -${suffix} suffix to metainfo"
    mv "${pkgdir}/usr/share/metainfo/org.blender.Blender.metainfo.xml" "${pkgdir}/usr/share/metainfo/org.blender-${_suffix}.Blender.metainfo.xml" || true

  if [[ -e "$pkgdir/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/" ]] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/*
  fi
}
# vim:set sw=2 ts=2 et:
