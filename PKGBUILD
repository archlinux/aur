#!/bin/hint/bash
# Maintainer: Xavier Cho <mysticfallband@gmail.com>
# Adapted from blender-develop-git package by bartus.

# Configuration.
# shellcheck disable=SC2206
[[ -v CUDA_ARCH ]] && _cuda_capability=(${CUDA_ARCH})

#some extra, unofficially supported stuff goes here:
((TRAVIS)) && _cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75)
((DISABLE_USD)) && {
  _CMAKE_FLAGS+=( -DWITH_USD=OFF )
} || {
  _CMAKE_FLAGS+=( -DWITH_USD=ON
        -DUSD_ROOT=/usr )
  depends+=( "usd=21.02" )
}
((DISABLE_NINJA)) ||  makedepends+=("ninja")
#shellcheck disable=SC2015
((DISABLE_CUDA)) && optdepends+=("cuda: CUDA support in Cycles") || { makedepends+=("cuda") ; ((DISABLE_OPTIX)) || makedepends+=("optix>=7.0"); }

pkgname=upbge-git
pkgver=112123.7b877cab449
pkgrel=1
pkgdesc="Uchronia Project Blender Game Engine fork of Blender Game Engine"
arch=("i686" "x86_64")
url="https://upbge.org/"
depends=("alembic" "embree" "libgl" "python" "python-numpy" "openjpeg2" "libharu" "potrace" "openxr"
         "ffmpeg" "fftw" "openal" "freetype2" "libxi" "openimageio" "opencolorio"
         "openvdb" "opencollada" "opensubdiv" "openshadinglanguage" "libtiff" "libpng" "openimagedenoise")
makedepends=("git" "cmake" "boost" "mesa" "llvm")
provides=("blender")
conflicts=("blender")
license=("GPL")
install=upbge.install

# NOTE: the source array has to be kept in sync with .gitmodules
# the submodules has to be stored in path ending with git to match
# the path in .gitmodules.
# More info:
#   http://wiki.blender.org/index.php/Dev:Doc/Tools/Git
source=(
  "git://github.com/UPBGE/upbge.git"
  "blender-addons.git::git://github.com/UPBGE/blender-addons.git"
  "blender-addons-contrib.git::git://git.blender.org/blender-addons-contrib.git"
  "blender-translations.git::git://git.blender.org/blender-translations.git"
  "blender-dev-tools.git::git://git.blender.org/blender-dev-tools.git"
  upbge.desktop
  SelectCudaComputeArch.patch
  usd_python.patch
  embree.patch
  openexr3.patch)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "b5c9bf4fa265389db4b3f23e96d74cc86c51d908b8943eb80967614d8af1ea1a"
  "66b9bf3db441f35119ef0eb5f855142f2e773e8002ac0216e056bcc6f8ac409c"
  "333b6fd864d55da2077bc85c55af1a27d4aee9764a1a839df26873a9f19b8703"
  "6249892f99ffd960e36f43fb893c14e2f8e4dd1d901b9581d25882e865f2603f"
  "5297dc61cc4edcc1d5bad3474ab882264b69d68036cebbd0f2600d9fe21d5a1b")

pkgver() {
	cd "$srcdir/upbge"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # update the submodules
  git -C "$srcdir/upbge" submodule update --init --recursive --remote
  if [ ! -v _cuda_capability ] && grep -q nvidia <(lsmod); then
  git -C "$srcdir/upbge" apply -v "${srcdir}"/SelectCudaComputeArch.patch
  fi
  ((DISABLE_USD)) || git -C "$srcdir/upbge" apply -v "${srcdir}"/usd_python.patch
  git -C "$srcdir/upbge" apply -v "${srcdir}"/{embree,openexr3}.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "Python version detected: ${_pyver}"

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
  cmake -G "$generator" -S "$srcdir/upbge" -B "$srcdir/build" \
    -C "$srcdir/upbge/build_files/cmake/config/blender_release.cmake" \
    -DWITH_GAMEENGINE=ON \
    -DWITH_PLAYER=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_INSTALL_PORTABLE=OFF \
    -DWITH_SYSTEM_GLEW=ON \
    -DWITH_PYTHON_INSTALL=OFF \
    -DWITH_FFTW3=ON \
    -DWITH_CODEC_FFMPEG=ON \
    -DWITH_MOD_OCEANSIM=ON \
    -DXR_OPENXR_SDK_ROOT_DIR=/usr \
    -DPYTHON_VERSION="${_pyver}" \
    "${_CMAKE_FLAGS[@]}"
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
# shellcheck disable=SC2086 # allow MAKEFLAGS to split when multiple flags provided.
  if ((DISABLE_NINJA)); then make -C "$srcdir/build" ; else ninja -C "$srcdir/build" ${MAKEFLAGS:--j1}; fi
}

package() {
  export DESTDIR="$pkgdir"

  if ((DISABLE_NINJA)); then make -C "$srcdir/build" install; else ninja -C "$srcdir/build" install; fi

  #undo rpath clean in cmake_install ( faster than patching CMakeLists.txt)
  cp "$srcdir/build/bin/blender" "$pkgdir/usr/bin/blender"

  mv "$pkgdir/usr/share/blender" "$pkgdir/usr/share/upbge"

  install -D -m755 "$srcdir"/build/bin/blenderplayer "$pkgdir"/usr/bin/blenderplayer
  install -D -m644 "$srcdir"/upbge.desktop "$pkgdir"/usr/share/applications/upbge.desktop
  install -D -m644 "$srcdir"/upbge/release/freedesktop/icons/scalable/apps/upbge.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/upbge.svg

  if [ -e "$pkgdir"/usr/share/upbge/*/scripts/addons/cycles/lib/ ] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/upbge/*/scripts/addons/cycles/lib/*
  fi
}
# vim:set sw=2 ts=2 et:
