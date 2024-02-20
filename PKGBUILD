#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration.
_fragment=${FRAGMENT:-#branch=main}
# Use CMAKE_FLAGS=xxx:yyy:zzz to define extra CMake flags
[[ -v CMAKE_FLAGS ]] && mapfile -t -d: CMAKE_FLAGS < <(echo -n "$CMAKE_FLAGS")
# shellcheck disable=SC2206
[[ -v CUDA_ARCH ]] && _cuda_capability=(${CUDA_ARCH})

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
  export PATH+=":/opt/materialx"
}
((DISABLE_NINJA)) || { makedepends+=('ninja'); : ${MAKEFLAGS:--j1}; }
#shellcheck disable=SC2015
((DISABLE_CUDA)) && optdepends+=('cuda: CUDA support in Cycles') || { makedepends+=('cuda') ; ((DISABLE_OPTIX)) || makedepends+=('optix>=7.4'); }

pkgname=blender-develop-git
pkgver=4.2.r133163.g99673edd853
pkgrel=1
pkgdesc="Development version of Blender (non-conflicting version)"
changelog=blender.changelog
arch=('i686' 'x86_64')
url="https://blender.org/"
depends+=('alembic' 'embree' 'libgl' 'python' 'python-numpy' 'openjpeg2' 'libharu' 'potrace' 'openxr'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')
depends+=('openimagedenoise')
depends+=('libdecor' 'libepoxy')
depends+=('openpgl')
depends+=('shaderc')
makedepends+=('git' 'cmake' 'clang' 'boost' 'mesa' 'llvm' wayland{,-protocols} 'vulkan-headers' 'libxkbcommon')
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
        'blender-addons::git+https://github.com/blender/blender-addons'
        'blender-addons-contrib::git+https://github.com/blender/blender-addons-contrib'
        'blender-translations::git+https://github.com/blender/blender-translations'
        'blender-dev-tools::git+https://github.com/blender/blender-dev-tools'
        SelectCudaComputeArch.patch
        blender-sycl-path.patch
        force-draco1.patch
        force-draco2.patch
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '60ac315c873a3842dd46393ed351c008255911a8fa352d39587a5eede3983e3a'
            '05e83a1c06790594fcd96f86bac7912d67c91ce9076cfc7088203b37f65949b1'
            'e3ff41269ab26f34e7762ee2754d238af375761131178917f61a97763f60ee0d'
            'a7c809d2b979e097a1853d42ad0edb6d9fa2ef51c99424257e5ec083ef76bb03')

pkgver() {
  blender_version=$(grep -Po "BLENDER_VERSION \K[0-9]{3}" "$srcdir"/blender/source/blender/blenkernel/BKE_blender_version.h)
  printf "%d.%d.r%s.g%s" \
    $((blender_version/100)) \
    $((blender_version%100)) \
    "$(git -C "$srcdir/blender" rev-list --count HEAD)" \
    "$(git -C "$srcdir/blender" rev-parse --short HEAD)"
}

prepare() {
  # update the submodules
  make V=1 -C "$srcdir/blender" update_code
  if [ ! -v _cuda_capability ] && grep -q nvidia <(lsmod); then
    git -C "$srcdir/blender" apply -v "${srcdir}"/SelectCudaComputeArch.patch
  fi
  ((DISABLE_DRACO)) || git -C "$srcdir/blender" apply -v "${srcdir}"/force-draco1.patch
  ((DISABLE_DRACO)) || git -C "$srcdir/blender/scripts/addons" apply -v "${srcdir}"/force-draco2.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=$(pacman -Qq cuda 2>/dev/null) || true
  if [ "$_CUDA_PKG" != "" ] && ! ((DISABLE_CUDA)) ; then
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON
                  -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
    ((DISABLE_OPTIX)) || _CMAKE_FLAGS+=( -DOPTIX_ROOT_DIR=/opt/optix )
    if [[ -v _cuda_capability ]]; then
      _CMAKE_FLAGS+=( -DCYCLES_CUDA_BINARIES_ARCH="$(IFS=';'; echo "${_cuda_capability[*]}";)" )
    fi
    [ -f "/usr/lib/ccache/bin/nvcc-ccache" ] && export CUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache
    if _cuda_gcc=$(basename "$(readlink /opt/cuda/bin/gcc)") ; then
      [ -L "/usr/lib/ccache/bin/$_cuda_gcc" ] && export CUDAHOSTCXX=/usr/lib/ccache/bin/"$_cuda_gcc"
    fi
  fi

  ((DISABLE_NINJA)) && generator="Unix Makefiles" || generator="Ninja"
  cmake -G "$generator" -S "$srcdir/blender" -B "$srcdir/build" \
        -C "${srcdir}/blender/build_files/cmake/config/blender_release.cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_PYTHON_INSTALL=OFF \
        -DXR_OPENXR_SDK_ROOT_DIR=/usr \
        -DPYTHON_VERSION="${_pyver}" \
        "${_CMAKE_FLAGS[@]}"
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
# shellcheck disable=SC2086 # allow MAKEFLAGS to split when multiple flags provided.
  cmake --build build ${MAKEFLAGS}
}

package() {
  _suffix=${pkgver%%.r*}
  _pyver=$(python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))')
  BLENDER_SYSTEM_PYTHON=/usr/lib/python${_pyver} BLENDER_SYSTEM_RESOURCES="${pkgdir}/usr/share/blender/${_suffix}" DESTDIR="${pkgdir}" cmake --install build || ((DISABLE_DRACO)) && true
  python -m compileall "${pkgdir}/usr/share/blender"
  python -O -m compileall "${pkgdir}/usr/share/blender"

  # Manually install additional scripts (See FS#69351)
  cp -r blender/scripts/addons_contrib/* "${pkgdir}"/usr/share/blender/4*/scripts/addons_contrib/

  # Manually install draco bindings (See FS#73415)
  ((DISABLE_DRACO)) || {
  mkdir -p "${pkgdir}/usr/lib/python${_pyver}"/
  mv "${pkgdir}"/usr/share/blender/4*/python/lib/* "${pkgdir}"/usr/lib/
  rm -r "${pkgdir}"/usr/share/blender/4*/python
  }

  # Move OneAPI AOT lib to proper place
# mv "${pkgdir}"/usr/share/blender/lib/libcycles_kernel_oneapi_aot.so "${pkgdir}"/usr/lib/

    msg "add -${_suffix} suffix to desktop shortcut"
    sed -i "s/=blender/=blender-${_suffix}/g" "${pkgdir}/usr/share/applications/blender.desktop"
    sed -i "s/=Blender/=Blender-${_suffix}/g" "${pkgdir}/usr/share/applications/blender.desktop"
    mv "${pkgdir}/usr/share/applications/blender.desktop" "${pkgdir}/usr/share/applications/blender-${_suffix}.desktop"

    msg "add -${_suffix} suffix to binaries"
    mv "${pkgdir}/usr/bin/blender" "${pkgdir}/usr/bin/blender-${_suffix}"
    mv "${pkgdir}/usr/bin/blender-thumbnailer" "${pkgdir}/usr/bin/blender-${_suffix}-thumbnailer"

    msg "mv doc/blender to doc/blender-${_suffix}"
    mv "${pkgdir}/usr/share/doc/blender" "${pkgdir}/usr/share/doc/blender-${_suffix}"

    msg "add -${_suffix} suffix to man page"
    ((DISABLE_DRACO)) && mv "${pkgdir}/usr/share/man/man1/blender.1" "${pkgdir}/usr/share/man/man1/blender-${_suffix}.1"

    msg "add -${_suffix} suffix to all icons"
    while read -r icon
    do
      # ${filename##/*.} extra extenssion from path
      # ${filename%.*} extract filename form path
      # look at bash "manipulatin string"
      mv "$icon" "${icon%.*}-${_suffix}.${icon##/*.}"
    done < <(find "${pkgdir}/usr/share/icons" -type f)

    msg "add -${suffix} suffix to metainfo"
    mv "${pkgdir}/usr/share/metainfo/org.blender.Blender.metainfo.xml" "${pkgdir}/usr/share/metainfo/org.blender-${_suffix}.Blender.metainfo.xml"

  if [[ -e "$pkgdir/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/" ]] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/*
  fi
}
# vim:set sw=2 ts=2 et:
