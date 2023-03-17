#!/bin/hint/bash
# Maintainer: Xavier Cho <mysticfallband@gmail.com>
#shellcheck disable=SC2015

pkgname=upbge-git
pkgver=128099.f7197011182
pkgrel=1
pkgdesc="Uchronia Project Blender Game Engine fork of Blender Game Engine"
arch=("i686" "x86_64")
url="https://upbge.org/"
depends=("alembic" "embree" "libgl" "python" "python-numpy" "openjpeg2" "libharu" "potrace" "openxr"
         "ffmpeg" "fftw" "openal" "freetype2" "libxi" "openimageio" "opencolorio" "libdecor"
         "openvdb" "opencollada" "opensubdiv" "openshadinglanguage" "libtiff" "libpng" "openimagedenoise")
optdepends=("cuda: CUDA support in Cycles"
         "optix>=7.1.0: OptiX support in Cycles"
         "openpgl: Path guiding support in Cycles"
         "usd: USD export Scene")
makedepends=("git" "cmake" "clang" "boost" "ninja" "mesa" "llvm" wayland{,-protocols} "libxkbcommon")
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
  "upbge::git+https://github.com/UPBGE/upbge.git"
  "blender-addons.git::git+https://github.com/UPBGE/blender-addons.git"
  "blender-addons-contrib.git::git+https://projects.blender.org/blender/blender-addons-contrib.git"
  "blender-translations.git::git+https://projects.blender.org/blender/blender-translations.git"
  "blender-dev-tools.git::git+https://projects.blender.org/blender/blender-dev-tools.git"
  upbge.desktop
  usd_python.patch
  SelectCudaComputeArch.patch
  embree.patch)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "b5c9bf4fa265389db4b3f23e96d74cc86c51d908b8943eb80967614d8af1ea1a"
  "5b98624ec2ce39fdb33836527343d026edbb63c948850b20c1c20c019d24f434"
  "155c04f971d3f45618a89fa73d91e21ba493ae24029475e18192c49c3fcd8cb4"
  "6e7392cfb159165dfd63e0cc7858e1ffdabc2aae4126288aca6a15082d3c7efc")

pkgver() {
	cd "$srcdir/upbge"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # update the submodules
  git -C "$srcdir/upbge" submodule update --init --recursive --remote
  if grep -q nvidia <(lsmod); then
    git -C "$srcdir/upbge" apply -v "${srcdir}"/SelectCudaComputeArch.patch
  fi
  ((DISABLE_USD)) || git -C "$srcdir/upbge" apply -v "${srcdir}"/usd_python.patch
  git -C "$srcdir/upbge" apply -v "${srcdir}"/embree.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "Python version detected: ${_pyver}"

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=$(pacman -Qq cuda 2>/dev/null) || true
  if [ "$_CUDA_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON
                    -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
    [ -f "/usr/lib/ccache/bin/nvcc-ccache" ] && export CUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache

    if _cuda_gcc=$(basename "$(readlink /opt/cuda/bin/gcc)") ; then
      [ -L "/usr/lib/ccache/bin/$_cuda_gcc" ] && export CUDAHOSTCXX=/usr/lib/ccache/bin/"$_cuda_gcc"
    fi
  fi

  # check for optix
  _OPTIX_PKG=$(pacman -Qq optix 2>/dev/null) || true
  if [ "$_OPTIX_PKG" != "" ]; then
      _CMAKE_FLAGS+=( -DWITH_CYCLES_DEVICE_OPTIX=ON
                      -DOPTIX_ROOT_DIR=/opt/optix )
  fi

  # check for universal scene descriptor
  _USD_PKG=$(pacman -Qq usd=21.02 2>/dev/null) || true
  if [ "$_USD_PKG" != "" ]; then
    _CMAKE_FLAGS+=( -DWITH_USD=ON
                    -DUSD_ROOT=/usr )
  fi

  cmake -G "Ninja" -S "$srcdir/upbge" -B "$srcdir/build" \
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
  ninja -C "$srcdir/build" ${MAKEFLAGS:--j$(nproc)}
}

package() {
  export DESTDIR="$pkgdir"

  ninja -C "$srcdir/build" install

  #undo rpath clean in cmake_install ( faster than patching CMakeLists.txt)
  cp "$srcdir/build/bin/blender" "$pkgdir/usr/bin/blender"

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
